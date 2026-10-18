import SwiftUI
import FamilyControls
import ManagedSettings
import DeviceActivity

/// Focus Shield: blocks the apps the person picked (Screen Time) while a soundscape session runs.
/// Needs the Family Controls entitlement (com.apple.developer.family-controls) on the app and on
/// both extensions, plus the shared App Group.
///
/// - The ShieldConfig extension draws the Escape-branded screen on blocked apps.
/// - The DeviceActivityMonitor extension lifts the shield when the session's time is up, even if
///   Escape was force-quit. The app also lifts it when the session ends, when the module closes
///   and on launch.
///
/// The store name and activity name must match the extensions (ShieldConfig/, DeviceActivityMonitor/).
@available(iOS 17.0, *)
@MainActor
public final class FocusShield {
    public static let shared = FocusShield()

    public static let appGroup = "group.com.flutterflow.escapellc"
    public static let storeName = "escape.focusShield"
    public static let activityName = "escape.focusShield.session"

    private let settings = ManagedSettingsStore(named: ManagedSettingsStore.Name(rawValue: FocusShield.storeName))
    private let center = DeviceActivityCenter()
    private let selectionKey = "escape.focusShield.selection"
    private let defaults = UserDefaults(suiteName: FocusShield.appGroup) ?? .standard

    private init() {
        // Builds before the App Group kept the selection in standard defaults.
        if defaults.data(forKey: selectionKey) == nil, let old = UserDefaults.standard.data(forKey: selectionKey) {
            defaults.set(old, forKey: selectionKey)
            UserDefaults.standard.removeObject(forKey: selectionKey)
        }
    }

    // MARK: - Selection

    var selection: FamilyActivitySelection {
        get {
            guard let data = defaults.data(forKey: selectionKey),
                  let s = try? JSONDecoder().decode(FamilyActivitySelection.self, from: data) else {
                return FamilyActivitySelection()
            }
            return s
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                defaults.set(data, forKey: selectionKey)
            }
        }
    }

    private static func hasItems(_ s: FamilyActivitySelection) -> Bool {
        !s.applicationTokens.isEmpty || !s.categoryTokens.isEmpty || !s.webDomainTokens.isEmpty
    }

    var isAuthorized: Bool { AuthorizationCenter.shared.authorizationStatus == .approved }

    /// Authorized and at least one app, category or site picked.
    public var isReady: Bool { isAuthorized && Self.hasItems(selection) }

    // MARK: - Turning it on

    /// Asks for Screen Time access (Face ID / passcode sheet from iOS). The app picker only shows
    /// the first time; after that the saved apps are used ("Edit Apps" changes them).
    /// Returns false if they decline or pick nothing.
    public func enable() async -> Bool {
        guard await authorize() else { return false }
        if Self.hasItems(selection) { return true }
        guard let picked = await pickApps(), Self.hasItems(picked) else { return false }
        selection = picked
        return true
    }

    /// "Edit Apps": the picker with the current apps. Re-applies the shield if a session is
    /// running. Returns true when at least one app is picked afterwards.
    public func editApps(sessionRunning: Bool) async -> Bool {
        guard await authorize() else { return false }
        if let picked = await pickApps(), Self.hasItems(picked) {
            selection = picked
            if sessionRunning { applyShield() }
        }
        return Self.hasItems(selection)
    }

    private func authorize() async -> Bool {
        if isAuthorized { return true }
        do {
            try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
        } catch {
            print("[FocusShield] authorization failed: \(error)")
        }
        return isAuthorized
    }

    /// Shows the system app picker over the module. nil when cancelled.
    private func pickApps() async -> FamilyActivitySelection? {
        guard let top = Self.topViewController() else { return nil }
        return await withCheckedContinuation { (cont: CheckedContinuation<FamilyActivitySelection?, Never>) in
            var finished = false
            var host: UIViewController?
            let view = FocusShieldPicker(selection: selection) { result in
                guard !finished else { return }
                finished = true
                host?.dismiss(animated: true)
                cont.resume(returning: result)
            }
            let vc = UIHostingController(rootView: view)
            vc.isModalInPresentation = true
            host = vc
            top.present(vc, animated: true)
        }
    }

    // MARK: - Shielding

    /// Blocks the picked apps now (start of a session) and schedules the unblock for when the
    /// session's time is up, so it happens even if Escape isn't running then.
    public func activate(seconds: Int) {
        guard isReady else { return }
        applyShield()
        scheduleEnd(after: seconds)
    }

    private func applyShield() {
        let s = selection
        settings.shield.applications = s.applicationTokens.isEmpty ? nil : s.applicationTokens
        settings.shield.applicationCategories = s.categoryTokens.isEmpty ? nil : .specific(s.categoryTokens)
        settings.shield.webDomains = s.webDomainTokens.isEmpty ? nil : s.webDomainTokens
    }

    /// iOS needs a monitored interval of at least 15 minutes. Shorter sessions still unlock on
    /// time through the app; the monitor is the backstop if Escape was killed.
    private func scheduleEnd(after seconds: Int) {
        let now = Date()
        let length = max(TimeInterval(seconds), 15 * 60) + 30
        let parts: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let cal = Calendar.current
        let schedule = DeviceActivitySchedule(
            intervalStart: cal.dateComponents(parts, from: now),
            intervalEnd: cal.dateComponents(parts, from: now.addingTimeInterval(length)),
            repeats: false)
        let activity = DeviceActivityName(rawValue: Self.activityName)
        center.stopMonitoring([activity])
        do {
            try center.startMonitoring(activity, during: schedule)
        } catch {
            print("[FocusShield] couldn't schedule the unlock: \(error)")
        }
    }

    /// Unblocks everything Escape blocked and cancels the scheduled unlock.
    public func deactivate() {
        settings.clearAllSettings()
        center.stopMonitoring([DeviceActivityName(rawValue: Self.activityName)])
    }

    private static func topViewController() -> UIViewController? {
        let window = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        var top = window?.rootViewController
        while let next = top?.presentedViewController { top = next }
        return top
    }
}

/// The system FamilyActivityPicker with Cancel / Done.
@available(iOS 17.0, *)
private struct FocusShieldPicker: View {
    @State var selection: FamilyActivitySelection
    var done: (FamilyActivitySelection?) -> Void

    var body: some View {
        NavigationStack {
            FamilyActivityPicker(
                headerText: "Pick the apps Focus Shield blocks while a soundscape plays. They unlock when the session ends.",
                selection: $selection)
            .navigationTitle("Focus Shield")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { done(nil) }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { done(selection) }
                }
            }
        }
    }
}
