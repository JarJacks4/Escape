import Foundation

/// Platform work the Soundscapes screens need from the device. The Objective-C team owns the
/// real implementation (ObjC/ESCPlatformServices.m), bridged by `ObjCHostServices`.
/// Every method has a safe default, so previews and tests can use `PreviewHostServices`.
@available(iOS 17.0, *)
public protocol HostServices: AnyObject, Sendable {
    /// Shows the system permission dialog. Only call after the PermissionPrimer's "Allow".
    func requestPermission(_ permission: InputSetting.Permission) async -> Bool
    func hasPermission(_ permission: InputSetting.Permission) -> Bool
    /// Last known coordinate, only when location permission is granted.
    func currentLocation() async -> (lat: Double, lon: Double)?
    /// Latest heart rate from HealthKit, only when health permission is granted.
    func latestHeartRate() async -> Double?

    /// StoreKit / RevenueCat purchase. Return true when the entitlement is active.
    func purchase(productId: String) async throws -> Bool
    func restorePurchases() async throws -> Bool

    /// Local notifications: Sunrise Wake ("07:00"), circle reminders, "your soundscape is ready".
    func scheduleSunriseWake(at hhmm: String) async -> Bool
    func cancelSunriseWake()
    func scheduleCircleReminder(id: String, title: String, when: String) async -> Bool
    func cancelCircleReminder(id: String)
    func notifyCompositionReady(title: String)

    /// Focus Shield (Screen Time). Needs the Family Controls entitlement.
    /// on: asks for Screen Time access and lets the person pick apps; false if they decline.
    /// off: unblocks everything.
    func setFocusShield(_ on: Bool) async -> Bool
    /// Screen Time access granted and apps picked on this device.
    func focusShieldReady() async -> Bool
    /// Blocks the picked apps for the running session (true) or unblocks them (false).
    /// `seconds` is how long the session has left, for the scheduled unblock.
    func applyFocusShield(_ active: Bool, seconds: Int) async
    /// "Edit Apps": the app picker. True when at least one app is picked afterwards.
    func editFocusShieldApps(sessionRunning: Bool) async -> Bool

    func haptic(_ kind: HapticKind)
    func track(_ event: String, _ properties: [String: String])
}

@available(iOS 17.0, *)
public enum HapticKind: String, Sendable { case selection, light, medium, success, warning }

/// No-op host for previews, tests and the first run before the ObjC layer is wired.
@available(iOS 17.0, *)
public final class PreviewHostServices: HostServices, @unchecked Sendable {
    public var granted: Set<InputSetting.Permission> = []
    public var events: [(String, [String: String])] = []
    public init() {}
    public func requestPermission(_ p: InputSetting.Permission) async -> Bool { granted.insert(p); return true }
    public func hasPermission(_ p: InputSetting.Permission) -> Bool { granted.contains(p) }
    public func currentLocation() async -> (lat: Double, lon: Double)? { granted.contains(.location) ? (40.7128, -74.0060) : nil }
    public func latestHeartRate() async -> Double? { granted.contains(.health) ? 72 : nil }
    public func purchase(productId: String) async throws -> Bool { true }
    public func restorePurchases() async throws -> Bool { false }
    public func scheduleSunriseWake(at hhmm: String) async -> Bool { true }
    public func cancelSunriseWake() {}
    public func scheduleCircleReminder(id: String, title: String, when: String) async -> Bool { true }
    public func cancelCircleReminder(id: String) {}
    public func notifyCompositionReady(title: String) {}
    public func setFocusShield(_ on: Bool) async -> Bool { true }
    public func focusShieldReady() async -> Bool { true }
    public func applyFocusShield(_ active: Bool, seconds: Int) async {}
    public func editFocusShieldApps(sessionRunning: Bool) async -> Bool { true }
    public func haptic(_ kind: HapticKind) {}
    public func track(_ event: String, _ properties: [String: String]) { events.append((event, properties)) }
}
