import SwiftUI
import UIKit

/// Objective-C entry point into the SwiftUI app (used by ESCSoundscapesViewController).
/// UIHostingController is Swift-only, so ObjC asks this factory for a plain UIViewController.
@available(iOS 17.0, *)
@objc(SoundscapesHostingFactory)
@MainActor
public final class SoundscapesHostingFactory: NSObject {
    private let store: AppStore

    /// Live backend; `tokenProvider` hands back a Firebase ID token (or "dev:<uid>").
    @objc public init(baseURL: URL, tokenProvider: @escaping (@escaping (String?) -> Void) -> Void) {
        let provider: APIClient.TokenProvider = {
            await withCheckedContinuation { c in
                DispatchQueue.main.async { tokenProvider { c.resume(returning: $0) } }
            }
        }
        store = AppStore(api: APIClient(baseURL: baseURL, token: provider), audio: SoundscapePlayer(), host: ObjCHostServices())
        super.init()
    }

    /// Bundled Figma data, no network. ObjC: `[[SoundscapesHostingFactory alloc] initWithMockData:YES]`.
    @objc public init(mockData: Bool) {
        let api: SoundscapesAPI = (try? MockSoundscapesAPI.bundled()) ?? APIClient.dev()
        store = AppStore(api: api, audio: SoundscapePlayer(), host: ObjCHostServices())
        super.init()
    }

    /// Bundled mock for everything except Browse and Now Playing, which use the Lucille v1 catalog.
    /// `tokenProvider` hands back a Firebase ID token (the plugin's getIdToken channel call).
    @objc public init(firstName: String?, lucilleTokenProvider: @escaping (@escaping (String?) -> Void) -> Void) {
        let token: @Sendable () async -> String? = {
            await withCheckedContinuation { c in
                DispatchQueue.main.async { lucilleTokenProvider { c.resume(returning: $0) } }
            }
        }
        let api: SoundscapesAPI
        if let mock = try? MockSoundscapesAPI.bundled() {
            api = LucilleBackedAPI(mock: mock, client: LucilleV1Client(token: token), firstName: firstName)
        } else {
            api = APIClient.dev()
        }
        store = AppStore(api: api, audio: SoundscapePlayer(), host: ObjCHostServices())
        super.init()
    }

    @objc public func makeViewController() -> UIViewController {
        let host = UIHostingController(rootView: RootView().environment(store).preferredColorScheme(.dark))
        host.view.backgroundColor = .clear
        return host
    }

    /// Play one Lucille track by id or title as soon as the module opens.
    @objc public func playTrack(id: String?, title: String?) {
        let store = store
        Task { @MainActor in await store.playTrack(id: id, title: title) }
    }

    /// "NowPlaying", "Library"… and optional sheet "MoodField", "PremiumSheet"… (Figma names).
    @objc public func openScreen(_ screen: String, sheet: String?) {
        if let s = Screen(rawValue: screen) {
            store.scanOpenedFromHost = (s == .moodScan)
            store.setScreen(s)
        }
        store.setSheet(sheet.flatMap(Sheet.init(rawValue:)))
    }
}


@available(iOS 17.0, *)
extension SoundscapesHostingFactory {
    /// Host hook: called with the tab name ("Home", "Lucille"…) when the user leaves Soundscapes.
    public func setExitHandler(_ handler: @escaping (String) -> Void) {
        store.onExitToHost = { handler($0.rawValue) }
        store.onOpenHostRoute = { handler($0) }
    }

    /// Host hook: closes the module and leaves Flutter where it was (Mood Scan opened from Flutter).
    public func setCloseHandler(_ handler: @escaping () -> Void) {
        store.onCloseToHost = handler
    }
}
