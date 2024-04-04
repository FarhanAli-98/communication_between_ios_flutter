import Flutter
import UIKit

class FLPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = FLNativeViewFactory(messenger: registrar.messenger(), playerArgs: PlayerArgs())
        registrar.register(factory, withId: "FLPlugin")
    }
}
