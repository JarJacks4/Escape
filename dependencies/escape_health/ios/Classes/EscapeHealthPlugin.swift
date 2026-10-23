// Escape Health — HealthKit side of the `escape_health` MethodChannel.
//
// Contract (see lib/escape_health.dart):
//   availability          -> "available" | "unsupported"
//   requestAuthorization  -> Bool (sheet shown and finished)
//   snapshot              -> [String: Any] with optional keys heartRate, heartRateAt (epoch ms),
//                            restingHeartRate, hrvMs, sleepMinutesLastNight, stepsToday
//   logStateOfMind        -> Bool (iOS 18+ only, false otherwise)
//   logMindfulSession     -> Bool
//   openStore             -> nil (no-op on iOS)
//
// Every path is failure-tolerant: errors become nil / false, never a FlutterError, never a crash.
// All replies to Flutter are delivered on the main thread.
import Flutter
import Foundation
import HealthKit
import UIKit

public class EscapeHealthPlugin: NSObject, FlutterPlugin {
  private let store: HKHealthStore? = HKHealthStore.isHealthDataAvailable() ? HKHealthStore() : nil

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "escape_health", binaryMessenger: registrar.messenger())
    let instance = EscapeHealthPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // Always answer on the main thread, exactly once.
    let reply: (Any?) -> Void = { value in
      if Thread.isMainThread {
        result(value)
      } else {
        DispatchQueue.main.async { result(value) }
      }
    }
    let args = call.arguments as? [String: Any] ?? [:]

    switch call.method {
    case "availability":
      reply(HKHealthStore.isHealthDataAvailable() ? "available" : "unsupported")
    case "requestAuthorization":
      requestAuthorization(reply)
    case "snapshot":
      snapshot(reply)
    case "logStateOfMind":
      let valence = (args["valence"] as? NSNumber)?.doubleValue ?? 0
      let label = args["label"] as? String ?? ""
      logStateOfMind(valence: valence, label: label, reply)
    case "logMindfulSession":
      guard let start = (args["start"] as? NSNumber)?.doubleValue,
            let end = (args["end"] as? NSNumber)?.doubleValue else {
        reply(false)
        return
      }
      let title = args["title"] as? String ?? "Escape"
      logMindfulSession(
        start: Date(timeIntervalSince1970: start / 1000.0),
        end: Date(timeIntervalSince1970: end / 1000.0),
        title: title,
        reply)
    case "openStore":
      reply(nil)
    default:
      reply(FlutterMethodNotImplemented)
    }
  }

  // MARK: - Types

  private var readTypes: Set<HKObjectType> {
    var types = Set<HKObjectType>()
    let quantityIds: [HKQuantityTypeIdentifier] = [
      .heartRate, .restingHeartRate, .heartRateVariabilitySDNN, .stepCount,
    ]
    for id in quantityIds {
      if let t = HKObjectType.quantityType(forIdentifier: id) { types.insert(t) }
    }
    if let sleep = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) { types.insert(sleep) }
    return types
  }

  private var shareTypes: Set<HKSampleType> {
    var types = Set<HKSampleType>()
    if let mindful = HKObjectType.categoryType(forIdentifier: .mindfulSession) { types.insert(mindful) }
    if #available(iOS 18.0, *) {
      types.insert(HKObjectType.stateOfMindType())
    }
    return types
  }

  // MARK: - Authorization

  private func requestAuthorization(_ reply: @escaping (Any?) -> Void) {
    guard let store = store else {
      reply(false)
      return
    }
    store.requestAuthorization(toShare: shareTypes, read: readTypes) { success, _ in
      reply(success)
    }
  }

  // MARK: - Snapshot

  private func snapshot(_ reply: @escaping (Any?) -> Void) {
    guard let store = store else {
      reply(nil)
      return
    }
    let lock = DispatchQueue(label: "com.escape.health.snapshot")
    var out: [String: Any] = [:]
    let group = DispatchGroup()
    let now = Date()
    let bpm = HKUnit.count().unitDivided(by: HKUnit.minute())

    func put(_ key: String, _ value: Any?) {
      guard let value = value else { return }
      lock.sync { out[key] = value }
    }

    // Latest heart rate in the last 2 hours.
    group.enter()
    latestQuantity(store, .heartRate, since: now.addingTimeInterval(-2 * 3600), until: now) { sample in
      if let s = sample {
        put("heartRate", s.quantity.doubleValue(for: bpm))
        put("heartRateAt", Int64((s.endDate.timeIntervalSince1970 * 1000).rounded()))
      }
      group.leave()
    }

    // Latest resting heart rate in the last 7 days.
    group.enter()
    latestQuantity(store, .restingHeartRate, since: now.addingTimeInterval(-7 * 86400), until: now) { sample in
      if let s = sample { put("restingHeartRate", s.quantity.doubleValue(for: bpm)) }
      group.leave()
    }

    // Latest HRV (SDNN) in the last 7 days.
    group.enter()
    latestQuantity(store, .heartRateVariabilitySDNN, since: now.addingTimeInterval(-7 * 86400), until: now) { sample in
      if let s = sample {
        put("hrvMs", s.quantity.doubleValue(for: HKUnit.secondUnit(with: .milli)))
      }
      group.leave()
    }

    // Steps today (cumulative statistics de-duplicates iPhone + Watch).
    group.enter()
    stepsToday(store, now: now) { steps in
      if let steps = steps { put("stepsToday", steps) }
      group.leave()
    }

    // Sleep for the night ending today 18:00 local.
    group.enter()
    sleepLastNight(store, now: now) { minutes in
      if let minutes = minutes { put("sleepMinutesLastNight", minutes) }
      group.leave()
    }

    group.notify(queue: .main) {
      let result = lock.sync { out }
      reply(result)
    }
  }

  private func latestQuantity(
    _ store: HKHealthStore,
    _ id: HKQuantityTypeIdentifier,
    since start: Date,
    until end: Date,
    completion: @escaping (HKQuantitySample?) -> Void
  ) {
    guard let type = HKObjectType.quantityType(forIdentifier: id) else {
      completion(nil)
      return
    }
    let predicate = HKQuery.predicateForSamples(withStart: start, end: end, options: [])
    let sort = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
    let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: 1, sortDescriptors: [sort]) {
      _, samples, error in
      if error != nil {
        completion(nil)
        return
      }
      completion(samples?.first as? HKQuantitySample)
    }
    store.execute(query)
  }

  private func stepsToday(_ store: HKHealthStore, now: Date, completion: @escaping (Int?) -> Void) {
    guard let type = HKObjectType.quantityType(forIdentifier: .stepCount) else {
      completion(nil)
      return
    }
    let startOfDay = Calendar.current.startOfDay(for: now)
    let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
    let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum) {
      _, stats, error in
      guard error == nil, let sum = stats?.sumQuantity() else {
        completion(nil)
        return
      }
      completion(Int(sum.doubleValue(for: HKUnit.count()).rounded()))
    }
    store.execute(query)
  }

  /// Sums asleep stages (unspecified / core / deep / REM) for the 24 h window ending today at 18:00
  /// local. Overlapping samples from several sources (iPhone + Watch + third-party apps) are merged so
  /// time is never double-counted. In-bed and awake samples are ignored.
  private func sleepLastNight(_ store: HKHealthStore, now: Date, completion: @escaping (Int?) -> Void) {
    guard let type = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
      completion(nil)
      return
    }
    let cal = Calendar.current
    guard let windowEnd = cal.date(bySettingHour: 18, minute: 0, second: 0, of: now),
          let windowStart = cal.date(byAdding: .day, value: -1, to: windowEnd) else {
      completion(nil)
      return
    }
    // Raw values: 0 inBed, 1 asleep(Unspecified), 2 awake, 3 asleepCore, 4 asleepDeep, 5 asleepREM.
    // Raw values are used so this compiles cleanly with an iOS 14 deployment target.
    let asleepValues: Set<Int> = [1, 3, 4, 5]
    let predicate = HKQuery.predicateForSamples(withStart: windowStart, end: windowEnd, options: [])
    let sort = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)
    let query = HKSampleQuery(
      sampleType: type, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sort]
    ) { _, samples, error in
      guard error == nil, let samples = samples as? [HKCategorySample] else {
        completion(nil)
        return
      }
      var intervals: [(Date, Date)] = []
      for s in samples where asleepValues.contains(s.value) {
        let start = max(s.startDate, windowStart)
        let end = min(s.endDate, windowEnd)
        if end > start { intervals.append((start, end)) }
      }
      if intervals.isEmpty {
        completion(nil)
        return
      }
      intervals.sort { $0.0 < $1.0 }
      var total: TimeInterval = 0
      var current = intervals[0]
      for iv in intervals.dropFirst() {
        if iv.0 <= current.1 {
          if iv.1 > current.1 { current.1 = iv.1 }
        } else {
          total += current.1.timeIntervalSince(current.0)
          current = iv
        }
      }
      total += current.1.timeIntervalSince(current.0)
      let minutes = Int((total / 60.0).rounded())
      completion(minutes > 0 ? minutes : nil)
    }
    store.execute(query)
  }

  // MARK: - Writes

  private func logMindfulSession(start: Date, end: Date, title: String, _ reply: @escaping (Any?) -> Void) {
    guard let store = store,
          let type = HKObjectType.categoryType(forIdentifier: .mindfulSession),
          end > start else {
      reply(false)
      return
    }
    guard store.authorizationStatus(for: type) == .sharingAuthorized else {
      reply(false)
      return
    }
    let sample = HKCategorySample(
      type: type,
      value: HKCategoryValue.notApplicable.rawValue,
      start: start,
      end: end,
      metadata: ["EscapeSessionTitle": title])
    store.save(sample) { success, _ in
      reply(success)
    }
  }

  private func logStateOfMind(valence: Double, label: String, _ reply: @escaping (Any?) -> Void) {
    guard #available(iOS 18.0, *) else {
      reply(false)
      return
    }
    guard let store = store else {
      reply(false)
      return
    }
    let type = HKObjectType.stateOfMindType()
    guard store.authorizationStatus(for: type) == .sharingAuthorized else {
      reply(false)
      return
    }
    let clamped = min(1.0, max(-1.0, valence.isFinite ? valence : 0))
    let sample = HKStateOfMind(
      date: Date(),
      kind: .dailyMood,
      valence: clamped,
      labels: EscapeHealthPlugin.stateOfMindLabels(for: label),
      associations: [])
    store.save(sample) { success, _ in
      reply(success)
    }
  }

  @available(iOS 18.0, *)
  private static func stateOfMindLabels(for label: String) -> [HKStateOfMind.Label] {
    switch label.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() {
    // The app's check-in chips.
    case "calm": return [.calm, .peaceful]
    case "energized", "energised": return [.excited, .happy]
    case "focused": return [.confident]
    case "restless": return [.stressed, .anxious]
    case "tired": return [.drained]
    case "low": return [.sad]
    // Common free-form words, mapped 1:1 when HealthKit has the label.
    case "happy": return [.happy]
    case "joyful": return [.joyful]
    case "content": return [.content]
    case "grateful": return [.grateful]
    case "hopeful": return [.hopeful]
    case "peaceful": return [.peaceful]
    case "relieved": return [.relieved]
    case "excited": return [.excited]
    case "confident": return [.confident]
    case "proud": return [.proud]
    case "satisfied": return [.satisfied]
    case "sad": return [.sad]
    case "anxious": return [.anxious]
    case "stressed": return [.stressed]
    case "worried": return [.worried]
    case "overwhelmed": return [.overwhelmed]
    case "drained", "exhausted": return [.drained]
    case "lonely": return [.lonely]
    case "angry": return [.angry]
    case "frustrated": return [.frustrated]
    case "irritated": return [.irritated]
    case "scared": return [.scared]
    case "indifferent": return [.indifferent]
    default: return []
    }
  }
}
