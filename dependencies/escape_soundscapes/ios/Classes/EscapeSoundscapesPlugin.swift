import Flutter
import UIKit

/// Flutter bridge. Methods: isSupported, open({mock, baseUrl, screen, sheet}), close.
/// Calls back into Dart: getIdToken (returns a Firebase ID token), onExit(tab).
public final class EscapeSoundscapesPlugin: NSObject, FlutterPlugin {
    private let channel: FlutterMethodChannel
    private var presented: UIViewController?
    private var factoryRef: AnyObject?

    init(channel: FlutterMethodChannel) {
        self.channel = channel
        super.init()
    }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "escape_soundscapes", binaryMessenger: registrar.messenger())
        let instance = EscapeSoundscapesPlugin(channel: channel)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "isSupported":
            if #available(iOS 17.0, *) { result(true) } else { result(false) }
        case "open":
            guard #available(iOS 17.0, *) else {
                result(FlutterError(code: "unsupported", message: "Soundscapes requires iOS 17", details: nil))
                return
            }
            let args = call.arguments as? [String: Any] ?? [:]
            Task { @MainActor in self.open(args: args, result: result) }
        case "close":
            Task { @MainActor in
                self.dismiss(tab: nil)
                result(nil)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    @available(iOS 17.0, *)
    @MainActor
    private func open(args: [String: Any], result: @escaping FlutterResult) {
        guard presented == nil else { result(nil); return }
        SoundscapesFonts.register()

        let mock = args["mock"] as? Bool ?? true
        let factory: SoundscapesHostingFactory
        if !mock, let s = args["baseUrl"] as? String, let url = URL(string: s) {
            factory = SoundscapesHostingFactory(baseURL: url) { [weak self] done in
                guard let self else { done(nil); return }
                self.channel.invokeMethod("getIdToken", arguments: nil) { value in
                    done(value as? String)
                }
            }
        } else {
            factory = SoundscapesHostingFactory(mockData: true)
        }
        factory.setExitHandler { [weak self] tab in self?.dismiss(tab: tab) }
        if let screen = args["screen"] as? String {
            factory.openScreen(screen, sheet: args["sheet"] as? String)
        }

        let vc = factory.makeViewController()
        vc.modalPresentationStyle = .fullScreen
        guard let top = Self.topViewController() else {
            result(FlutterError(code: "no_view_controller", message: "No view controller to present from", details: nil))
            return
        }
        factoryRef = factory
        presented = vc
        top.present(vc, animated: true) { result(nil) }
    }

    @MainActor
    private func dismiss(tab: String?) {
        guard let vc = presented else { return }
        presented = nil
        vc.dismiss(animated: true) { [weak self] in
            self?.factoryRef = nil
            self?.channel.invokeMethod("onExit", arguments: tab)
        }
    }

    @MainActor
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
