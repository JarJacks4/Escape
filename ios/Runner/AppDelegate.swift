import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    var unrealController: UIViewController?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // Register Flutter plugins
        GeneratedPluginRegistrant.register(with: self)
        
        // Setup Unreal Engine Flutter channel
        if let controller = window?.rootViewController as? FlutterViewController {
            let channel = FlutterMethodChannel(name: "unreal_bridge", binaryMessenger: controller.binaryMessenger)
            
            channel.setMethodCallHandler { [weak self] (call, result) in
                if call.method == "launchUnrealFullScreen" {
                    if let args = call.arguments as? [String: Any],
                       let levelName = args["level"] as? String {
                        self?.launchUnreal(level: levelName)
                    }
                    result(nil)
                }
            }
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func launchUnreal(level: String) {
        // Load Unreal Engine ViewController from the Framework
        if let unrealVCClass = NSClassFromString("UnrealViewController") as? UIViewController.Type {
            unrealController = unrealVCClass.init()
            window?.rootViewController?.present(unrealController!, animated: true, completion: nil)
        }
    }
}