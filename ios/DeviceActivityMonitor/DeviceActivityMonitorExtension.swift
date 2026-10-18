import DeviceActivity
import ManagedSettings

/// Lifts Focus Shield when the session's scheduled time is up, even if Escape isn't running.
/// The store and activity names must match FocusShield.swift in the Soundscapes module.
class DeviceActivityMonitorExtension: DeviceActivityMonitor {
    private let store = ManagedSettingsStore(named: ManagedSettingsStore.Name(rawValue: "escape.focusShield"))
    private let activity = DeviceActivityName(rawValue: "escape.focusShield.session")

    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
        guard activity == self.activity else { return }
        store.clearAllSettings()
    }
}
