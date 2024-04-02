// import UIKit
// import Flutter

// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     let nativeViewFactory = NativeViewFactory()
//       registrar(forPlugin: "Runner")?.register(nativeViewFactory, withId: "NativeView")
//     GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }

//Objective-C code as below
//[[self registrarForPlugin:@”NativeViewFactory”] registerViewFactory:nativeViewFactory withId:@”NativeView”];


//
//  AppDelegate.swift
//  FlutterIntegration
//
//  Created by Hungerstation on 23/11/2022.
//

import UIKit
import Flutter
// The following library connects plugins with iOS platform code to this app.
import FlutterPluginRegistrant
struct User: Codable {
    let name: String
    let email: String
}
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
    var sendMessageChannel: FlutterMethodChannel!
   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        flutterEngine.run();
       
        sendMessageChannel = FlutterMethodChannel(
            name: "my_flutter_app.sendMessage",
            binaryMessenger: flutterEngine.binaryMessenger
        )
        sendMessageChannel.setMethodCallHandler({ [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            let data = Data((call.arguments as! String).utf8)
            let user = try! JSONDecoder().decode(User.self, from: data)
//            let name = (call.arguments as! [String: String])["name"]!
//            let email = (call.arguments as! [String: String])["email"]!
            guard call.method == "sendMessage" else {
                result(FlutterMethodNotImplemented)
                return
              }
            self?.callSomeMethod(name: user.name, email: user.email, result: result)
        })
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
        // Override point for customization after application launch.
        return true
    }
    
    private func callSomeMethod(name: String, email: String, result: FlutterResult) {
        result("native ios code \(name)  \(email)")
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

   let nativeViewFactory = NativeViewFactory()
      registrar(forPlugin: "Runner")?.register(nativeViewFactory, withId: "NativeView")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)

}

