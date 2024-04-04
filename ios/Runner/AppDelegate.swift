


import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        var url: String = "https://stream.mux.com/oKDHkWy5vbYtdSFgKvUO1tkfIglL9HfiRXxi00C6M5HE.m3u8"
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/player",
                                                  binaryMessenger: controller.binaryMessenger)
            
        batteryChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            
            // Note: this method is invoked on the UI thread.
            guard call.method == "initlilizePlayerController" else {
                result(FlutterMethodNotImplemented)
                return
            }
            let myresult = call.arguments as? [String: Any]
            var url = myresult?["URL"] as? String
            let thumbnail = myresult?["THUMBNAIL"] as? String
            let looping = myresult?["LOOPING"] as? Bool
            let autoplay = myresult?["AUTOPLAY"] as? Bool
            let cacha = myresult?["CACHEConfiguration"] as? Bool
            print("-----------> Getting Data From Flutter  <--------------")
            print(url!);
            print(thumbnail!);
            print(looping!);
            print(autoplay!);
            print(cacha!);
            url = (url ?? "https://stream.mux.com/oKDHkWy5vbYtdSFgKvUO1tkfIglL9HfiRXxi00C6M5HE.m3u8") as String;
            
        });
        
        
        weak var registrar = self.registrar(forPlugin: "FLPlugin")

        let factory = FLNativeViewFactory(messenger: registrar!.messenger(), url: url)
        self.registrar(forPlugin: "Runner")!.register(
            factory,
            withId: "NativeView")
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}




//import UIKit
//import Flutter
//
//@UIApplicationMain
//@objc class AppDelegate: FlutterAppDelegate {
//  override func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//  ) -> Bool {
//      
      
////
//    
//  let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
//  let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
//                                            binaryMessenger: controller.binaryMessenger)
//      
//      batteryChannel.setMethodCallHandler({
//            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
//            
//            // Note: this method is invoked on the UI thread.
//            guard call.method == "getBatteryLevel" else {
//             result(FlutterMethodNotImplemented)
//                return
//            }
//          let myresult = call.arguments as? [String: Any]
//          let value1 = myresult?["Nepal"] as? String
//          let value2 = myresult?["UK"] as? String
//          print(value1!);
//          print(value2!);
//          
////          For invoking flutter method from Swift
//          let channel = FlutterMethodChannel(name: "my_channel", binaryMessenger: controller.binaryMessenger)
//          let data = ["Nepal": "The most popular city of Nepal is Kathmandu.", "UK": "The most popular city of UK is London."]
////          channel.invokeMethod("my_method", arguments:data)
//          channel.invokeMethod("my_method", arguments:data) { (result) in
//              if let resultString = result as? String {
//                  print(resultString)
//              }
//          }
//        
//          
//          self?.getBatteryLevel(result: result)
//        })
//////
//      ///
//      ///
//     
//      let nativeViewFactory = NativeViewFactory()
//      registrar(forPlugin: "Runner")?.register(nativeViewFactory, withId: "NativeView")
//       GeneratedPluginRegistrant.register(with: self)
//       return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//  }
//    
//    
//////
//    private func getBatteryLevel(result: FlutterResult) {
//    let device = UIDevice.current
//      device.isBatteryMonitoringEnabled = true
//      if device.batteryState == UIDevice.BatteryState.unknown {
//        result(FlutterError(code: "UNAVAILABLE",
//                            message: "Battery info unavailable",
//                            details: nil))
//      } else {
//        result(Int(device.batteryLevel * 100))
//      }
//    }
//    
//////
//}
