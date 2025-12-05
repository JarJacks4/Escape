import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    var unrealController: UIViewController?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController

        // Setup Flutter channel for Unreal integration
        let channel = FlutterMethodChannel(name: "escapeapp.ai/unreal", binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler { [weak self] (call, result) in
            guard let self = self else { return }

            if call.method == "launchUnrealFullScreen" {
                if let args = call.arguments as? [String: Any],
                   let level = args["level"] as? String {
                    self.launchUnreal(level: level)
                    result(nil)
                } else {
                    result(FlutterError(code: "BAD_ARGS",
                                        message: "Missing level parameter",
                                        details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func launchUnreal(level: String) {
        // If Unreal is already running, dismiss first to avoid stacking
        if let currentUnreal = unrealController {
            currentUnreal.dismiss(animated: false) {
                self.unrealController = nil
                self.presentUnreal(level: level)
            }
        } else {
            presentUnreal(level: level)
        }
    }

    private func presentUnreal(level: String) {
        if let UnrealVC = NSClassFromString("UnrealViewController") as? UIViewController.Type {
            let vc = UnrealVC.init()
            vc.modalPresentationStyle = .fullScreen
            unrealController = vc
            window?.rootViewController?.present(vc, animated: true, completion: nil)
        } else {
            print("❌ UnrealViewController not found – check class name or bridging setup")
        }
    }
}

      window?.rootViewController?.present(unrealController!, animated: true, completion: nil)
    }
  }
}
