import Foundation

/// Bridges the Objective-C team's `ESCPlatformServices` into the Swift `HostServices`
/// protocol the AppStore uses. Callback APIs become async with checked continuations.
@available(iOS 17.0, *)
public final class ObjCHostServices: HostServices, @unchecked Sendable {
    private let services: ESCPlatformServices

    public init(services: ESCPlatformServices = .shared) { self.services = services }

    private func key(_ p: InputSetting.Permission) -> ESCPermission {
        switch p {
        case .location: .location
        case .health: .health
        case .calendar: .calendar
        }
    }

    public func requestPermission(_ p: InputSetting.Permission) async -> Bool {
        await withCheckedContinuation { c in services.requestPermission(key(p)) { c.resume(returning: $0) } }
    }

    public func hasPermission(_ p: InputSetting.Permission) -> Bool { services.hasPermission(key(p)) }

    public func currentLocation() async -> (lat: Double, lon: Double)? {
        await withCheckedContinuation { c in
            services.currentLocation { ok, lat, lon in c.resume(returning: ok ? (lat: lat, lon: lon) : nil) }
        }
    }

    public func latestHeartRate() async -> Double? {
        await withCheckedContinuation { c in services.latestHeartRate { bpm in c.resume(returning: bpm > 0 ? bpm : nil) } }
    }

    public func purchase(productId: String) async throws -> Bool {
        try await withCheckedThrowingContinuation { c in
            services.purchase(productId: productId) { ok, error in
                if let error { c.resume(throwing: error) } else { c.resume(returning: ok) }
            }
        }
    }

    public func restorePurchases() async throws -> Bool {
        try await withCheckedThrowingContinuation { c in
            services.restorePurchases { ok, error in
                if let error { c.resume(throwing: error) } else { c.resume(returning: ok) }
            }
        }
    }

    public func scheduleSunriseWake(at hhmm: String) async -> Bool {
        await withCheckedContinuation { c in services.scheduleSunriseWake(at: hhmm) { c.resume(returning: $0) } }
    }

    public func cancelSunriseWake() { services.cancelSunriseWake() }

    public func scheduleCircleReminder(id: String, title: String, when: String) async -> Bool {
        await withCheckedContinuation { c in
            services.scheduleCircleReminder(id: id, title: title, when: when) { c.resume(returning: $0) }
        }
    }

    public func cancelCircleReminder(id: String) { services.cancelCircleReminder(id: id) }
    public func notifyCompositionReady(title: String) { services.notifyCompositionReady(title: title) }

    public func setFocusShield(_ on: Bool) async -> Bool {
        await withCheckedContinuation { c in services.setFocusShield(on) { c.resume(returning: $0) } }
    }

    public func haptic(_ kind: HapticKind) {
        let h: ESCHaptic = switch kind {
        case .selection: .selection
        case .light: .light
        case .medium: .medium
        case .success: .success
        case .warning: .warning
        }
        services.playHaptic(h)
    }

    public func track(_ event: String, _ properties: [String: String]) { services.track(event, properties: properties) }
}
