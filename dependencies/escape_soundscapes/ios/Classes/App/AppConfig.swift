import Foundation

/// Where the app gets its data. Set in the scheme (Edit Scheme › Run › Arguments) or Info.plist.
///
/// - `-mock` (default in Debug when no URL is set): bundled Figma seed, no network.
/// - `-api http://localhost:8080`: the Node backend from /backend (`npm run dev`).
/// - Info.plist `EscapeAPIBaseURL`: the deployed API (Release builds).
/// - `-uid <id>`: dev-auth user for the local backend (default `dev-jared`, the Figma user).
/// - `-screen NowPlaying` / `-sheet MoodField`: open straight on a Figma screen (UI tests, design review).
@available(iOS 17.0, *)
public struct AppConfig: Sendable {
    public enum Backend: Sendable { case mock, live(URL) }
    public var backend: Backend
    public var devUid: String
    public var startScreen: Screen?
    public var startSheet: Sheet?
    public var quickNav: Bool

    public static func current(_ args: [String] = ProcessInfo.processInfo.arguments, info: [String: Any] = Bundle.main.infoDictionary ?? [:]) -> AppConfig {
        func value(after flag: String) -> String? {
            guard let i = args.firstIndex(of: flag), i + 1 < args.count else { return nil }
            return args[i + 1]
        }
        var backend: Backend = .mock
        if args.contains("-mock") {
            backend = .mock
        } else if let s = value(after: "-api"), let url = URL(string: s) {
            backend = .live(url)
        } else if let s = info["EscapeAPIBaseURL"] as? String, !s.isEmpty, let url = URL(string: s) {
            backend = .live(url)
        }
        #if DEBUG
        let quick = !args.contains("-noQuickNav")
        #else
        let quick = false
        #endif
        return AppConfig(backend: backend, devUid: value(after: "-uid") ?? "dev-jared",
                         startScreen: value(after: "-screen").flatMap(Screen.init(rawValue:)),
                         startSheet: value(after: "-sheet").flatMap(Sheet.init(rawValue:)),
                         quickNav: quick)
    }
}
