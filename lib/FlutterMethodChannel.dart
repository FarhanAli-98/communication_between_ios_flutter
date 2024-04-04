// ignore_for_file: avoid_print

import 'package:flutter/services.dart';

class FlutterNativeCodeListenerMethodChannel {
  static const channelName = 'samples.flutter.dev/player'; // this channel name needs to match the one in Native method channel
  static MethodChannel? methodChannel;

  static final FlutterNativeCodeListenerMethodChannel instance = FlutterNativeCodeListenerMethodChannel._init();
  FlutterNativeCodeListenerMethodChannel._init();

  static void configureChannel() {
    methodChannel = const MethodChannel(channelName);
    // set method handler
  }



  static Future<bool> buildPlayerController(String url, String thumbnail, bool looping, bool autoplay, bool cacheConfiguration) async {
    ///invoke player controller
    ///invoke eventChannel
    ///Handl initilization and play or pause implementation

    Map videoModel = {'URL': url, 'THUMBNAIL': thumbnail, 'LOOPING': looping, 'AUTOPLAY': autoplay, 'CACHEConfiguration': cacheConfiguration};
    try {
      await methodChannel?.invokeMethod('initlilizePlayerController', videoModel);
    } on PlatformException catch (e) {}
    return true;
  }



  // static Future<String> getBatteryLevel() async {
  //   String batteryLevel;
  //   Map data = {"Nepal": "The capital city of Nepal is Kathmandu.", "UK": "The capital city of UK is London."};
  //   try {
  //     // here also you can name your method anything you like
  //     final int result = await methodChannel?.invokeMethod('getBatteryLevel', data);
  //     batteryLevel = 'Battery level at $result % .';
  //   } on PlatformException catch (e) {
  //     batteryLevel = "Failed to get battery level: '${e.message}'.";
  //   }

  //   return batteryLevel;
  // }




  // static invokeFromSwift() {
  //   MethodChannel channel = const MethodChannel('my_channel');
  //   channel.setMethodCallHandler(callingThisMethodFromSwift);
  // }

  // static Future<dynamic> callingThisMethodFromSwift(MethodCall call) async {
  //   switch (call.method) {
  //     case 'my_method':
  //       // Do something
  //       final Map arguments = call.arguments;
  //       final String arg1 = arguments['Nepal'];
  //       final String arg2 = arguments['UK'];
  //       print(arg1);
  //       print(arg2);
  //       print("\nOur Native iOS code is calling Flutter method/!!");
  //       return "Awesome!!";
  //     // break;
  //     default:
  //       throw PlatformException(
  //         code: 'Unimplemented',
  //         details: 'Method ${call.method} not implemented',
  //       );
  //   }
  // }





}
