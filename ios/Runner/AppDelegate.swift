


import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var controller: FlutterViewController = FlutterViewController()
    var playerChannel = FlutterMethodChannel()
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        weak var registrar = self.registrar(forPlugin: "FLPlugin")
        let factory = FLNativeViewFactory(messenger: registrar!.messenger(), playerArgs: PlayerArgs())
        self.registrar(forPlugin: "Runner")!.register(
            factory,
            withId: "NativeView")
        self.controller = window?.rootViewController as! FlutterViewController
        self.playerChannel = FlutterMethodChannel(name: "player_main_channel",
                                                  binaryMessenger: controller.binaryMessenger)
        playerChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            if call.method == "setDataSource" {
                factory.playerArgs = self?.handleSetDataSource(call: call) ?? PlayerArgs()
            } else if call.method == "play" {
                self?.handlePlayAction()
            } else if call.method == "pause" {
                self?.handlePauseAction()
            } else if call.method == "restart" {
                self?.handleRestartAction()
            }
        });
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func invokeData(name: String, args: [String: String]) {
        self.playerChannel.invokeMethod(name, arguments: args)
    }
}
extension AppDelegate {
    func handleSetDataSource(call: FlutterMethodCall) -> PlayerArgs {
        let args = PlayerArgs()
        let myresult = call.arguments as? [String: Any]
        if let value = myresult?["url"] as? String {
            args.videoUrl = value
        }
        if let thumbnail = myresult?["imageUrl"] as? String {
            args.thumbnailUrl = thumbnail
        }
        if let looping = myresult?["loopinig"] as? Bool {
            args.islooping = looping
        }
        if let autoplay = myresult?["autoplay"] as? Bool {
            args.autoPlay = autoplay
        }
        if let cacha = myresult?["useCache"] as? Bool {
            args.cacheConfiguration = cacha
        }
        return args
    }
    func handlePlayAction() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "perform_actions"), object: nil, userInfo: ["action": "play"])
    }
    func handlePauseAction() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "perform_actions"), object: nil, userInfo: ["action": "pause"])
    }
    func handleRestartAction() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "perform_actions"), object: nil, userInfo: ["action": "restart"])
    }
}
