// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:flutter/services.dart';

class FlutterNativeCodeListenerMethodChannel {
  static const channelName = 'player_main_channel'; // this channel name needs to match the one in Native method channel
  static MethodChannel? playerChannel;

  static final FlutterNativeCodeListenerMethodChannel instance = FlutterNativeCodeListenerMethodChannel._init();
  FlutterNativeCodeListenerMethodChannel._init();
  // EventChannel _eventChannelFor(int? textureId) {
  //   return EventChannel('player_channel/videoEvents$textureId');
  // }

  static Future<MethodChannel> init() async {
    playerChannel = const MethodChannel(channelName);
    return playerChannel!;
  }

  static Future<bool> setDataSource(String url, String thumbnail, bool looping, bool autoplay, bool useCache) async {
    Map dataSourceDescription = <String, dynamic>{
      'url': url,
      'useCache': useCache,
      'imageUrl': thumbnail,
      'loopinig': false,
      'autoplay': autoplay,
    };

    try {
      await playerChannel?.invokeMethod('setDataSource', dataSourceDescription);
    } on PlatformException catch (e) {
      log("Exception in initlilizePlayerController $e");
      return false;
    }
    return true;
  }

  static Future<void> play(int? textureId) async {
    try {
      playerChannel!.invokeMethod<void>(
        'play',
        <String, dynamic>{'textureId': textureId},
      );
    } on PlatformException catch (e) {
      log("Exception: in playing video $e");
    }
  }

  static Future<void> pause(int? textureId) async {
    try {
      playerChannel!.invokeMethod<void>(
        'pause',
        <String, dynamic>{'textureId': textureId},
      );
    } on PlatformException catch (e) {
      log("Exception in pausing video $e");
    }
  }

  static Future<void> reStart(int? textureId) async {
    try {
      playerChannel!.invokeMethod<void>(
        'restart',
      );
    } on PlatformException catch (e) {
      log("Exception in pausing video $e");
    }
  }

  Future<void> setMethodCallHandler() async {
    playerChannel!.setMethodCallHandler(callingThisMethodFromSwift);
  }

  static Future<dynamic> callingThisMethodFromSwift(MethodCall call) async {
    switch (call.method) {
      case 'initilize':
        final Map arguments = call.arguments;
        final String arg1 = arguments['data'];
        print(arg1);
        return "Awesome!!";
      case 'play':
      //video is playing
      case 'pause':
      //video is pausing
      case 'onFinish':
      //video is finished
      case 'setDataSource':
      //video is playing
      case 'setLooping':
      //video is pausing
      case 'setAutoplay':
      //video is pausing
      case 'setUseCache':
      //video is pausing
      case 'setImageUrl':
      //video is pausing
      case 'setType':
      //video is pausing
      case 'setUrl':
      //video is pausing
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'The method ${call.method} is not implemented',
          message: 'Unimplemented',
        );
    }
  }

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










  // @override
  // Stream<void> videoEventsFor(int? textureId) {
  //   return _eventChannelFor(textureId)
  //       .receiveBroadcastStream()
  //       .map((dynamic event) {
  //     late Map<dynamic, dynamic> map;
  //     if (event is Map) {
  //       map = event;
  //     }
  //     final String? eventType = map["event"] as String?;
  //     final String? key = map["key"] as String?;
  //     switch (eventType) {
  //       case 'initialized':
  //         double width = 0;
  //         double height = 0;

  //         // try {
  //         //   if (map.containsKey("width")) {
  //         //     final num widthNum = map["width"] as num;
  //         //     width = widthNum.toDouble();
  //         //   }
  //         //   if (map.containsKey("height")) {
  //         //     final num heightNum = map["height"] as num;
  //         //     height = heightNum.toDouble();
  //         //   }
  //         // } catch (exception) {
  //         //   BetterPlayerUtils.log(exception.toString());
  //         // }

  //         final Size size = Size(width, height);

  //         return VideoEvent(
  //           eventType: VideoEventType.initialized,
  //           key: key,
  //           duration: Duration(milliseconds: map['duration'] as int),
  //           size: size,
  //         );
  //       case 'completed':
  //         return VideoEvent(
  //           eventType: VideoEventType.completed,
  //           key: key,
  //         );
  //       case 'bufferingUpdate':
  //         final List<dynamic> values = map['values'] as List;

  //         return VideoEvent(
  //           eventType: VideoEventType.bufferingUpdate,
  //           key: key,
  //           buffered: values.map<DurationRange>(_toDurationRange).toList(),
  //         );
  //       case 'bufferingStart':
  //         return VideoEvent(
  //           eventType: VideoEventType.bufferingStart,
  //           key: key,
  //         );
  //       case 'bufferingEnd':
  //         return VideoEvent(
  //           eventType: VideoEventType.bufferingEnd,
  //           key: key,
  //         );

  //       case 'play':
  //         return VideoEvent(
  //           eventType: VideoEventType.play,
  //           key: key,
  //         );

  //       case 'pause':
  //         return VideoEvent(
  //           eventType: VideoEventType.pause,
  //           key: key,
  //         );

  //       case 'seek':
  //         return VideoEvent(
  //           eventType: VideoEventType.seek,
  //           key: key,
  //           position: Duration(milliseconds: map['position'] as int),
  //         );

  //       case 'pipStart':
  //         return VideoEvent(
  //           eventType: VideoEventType.pipStart,
  //           key: key,
  //         );

  //       case 'pipStop':
  //         return VideoEvent(
  //           eventType: VideoEventType.pipStop,
  //           key: key,
  //         );

  //       default:
  //         return VideoEvent(
  //           eventType: VideoEventType.unknown,
  //           key: key,
  //         );
  //     }
  //   });
  // }



