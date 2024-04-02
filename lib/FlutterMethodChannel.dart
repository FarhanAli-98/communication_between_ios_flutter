import 'package:flutter/services.dart';

class FlutterNativeCodeListenerMethodChannel {
  static const channelName = 'my_flutter_app.messageToNativeCodeChannel'; // this channel name needs to match the one in Native method channel
  MethodChannel? methodChannel;

  static final FlutterNativeCodeListenerMethodChannel instance = FlutterNativeCodeListenerMethodChannel._init();
  FlutterNativeCodeListenerMethodChannel._init();

  void configureChannel() {
    methodChannel = const MethodChannel(channelName);
    // set method handler
  }

  
}