import SwiftUI
import FamilyControls
import ManagedSettings

/// Focus Shield: blocks the apps the person picked (Screen Time) while a soundscape session runs.
/// Needs the Family Controls entitlement (com.apple.developer.family-controls) on the app.
/// The shield is always cleared when the session ends, when the module closes and on app launch,
/// so a crash or a kill can never leave apps blocked past the next open.
@available(iOS 17.0, *)
@MainActor
public final class FocusShield {
    public static let shared = FocusShield()

    private let settings = ManagedSettingsStore(named: ManagedSettingsStore.Name(rawValue: "escape.focusShield"))
    private let selectionKey = "escape.focusShield.selection"

    private init() {}

    // MARK: - Selection

    var selection: FamilyActivitySelection {
        get {
            guard let data = UserDefaults.standard.data(forKey: selectionKey),
                  let s = try? JSONDecoder().decode(FamilyActivitySelection.self, from: data) else {
                return FamilyActivitySelection()
            }
            return s
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: selectionKey)
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

    /// Asks for Screen Time access (Face ID / passcode sheet from iOS), then lets the person pick
    /// the apps to block. Returns false if they decline or pick nothing.
    public func enable() async -> Bool {
        guard await authorize() else { return false }
        guard let picked = await pickApps(), Self.hasItems(picked) else { return false }
        selection = picked
        return true
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

    /// Blocks the picked apps now (start of a session).
    public func activate() {
        guard isReady else { return }
        let s = selection
        settings.shield.applications = s.applicationTokens.isEmpty ? nil : s.applicationTokens
        settings.shield.applicationCategories = s.categoryTokens.isEmpty ? nil : .specific(s.categoryTokens)
        settings.shield.webDomains = s.webDomainTokens.isEmpty ? nil : s.webDomainTokens
    }

    /// Unblocks everything Escape blocked.
    public func deactivate() {
        settings.clearAllSettings()
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
