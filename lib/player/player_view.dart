// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype/FlutterMethodChannel.dart';
import 'package:prototype/player/configuration/event_type.dart';

const playerSwiftUiView = 'NativeView';

class PlayerSwiftView extends StatefulWidget {
  const PlayerSwiftView({super.key, required this.link, required this.thumbnail, required this.autoPlay, required this.cacheConfiguration, required this.looping});
  final String link;
  final String thumbnail;
  final bool autoPlay;
  final bool cacheConfiguration;
  final bool looping;

  @override
  State<PlayerSwiftView> createState() => _PlayerSwiftViewState();
}

class _PlayerSwiftViewState extends State<PlayerSwiftView> {
  BetterPlayerEventType? playerState;
  @override
  void initState() {
    super.initState();
    init();
    FlutterNativeCodeListenerMethodChannel.playerChannel!.setMethodCallHandler(callingThisMethodFromSwift);
  }

  init() async {
    FlutterNativeCodeListenerMethodChannel.init();
    await FlutterNativeCodeListenerMethodChannel.setDataSource(
      widget.link,
      widget.thumbnail,
      widget.looping,
      widget.autoPlay,
      widget.cacheConfiguration,
    );
  }

  Future<void> callingThisMethodFromSwift(MethodCall call) async {
    // Need to improve
    print('calling this method ${call.method}');
    switch (call.method) {
      case 'initialized':
        // final Map arguments = call.arguments;
        // print(arguments['data']);
        playerState = BetterPlayerEventType.initialized;
      case 'playing':
        playerState = BetterPlayerEventType.playing;
      case 'paused':
        playerState = BetterPlayerEventType.paused;
      case 'finished':
        playerState = BetterPlayerEventType.finished;
      default:
        playerState = BetterPlayerEventType.paused;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const UiKitView(viewType: playerSwiftUiView),
        GestureDetector(
          onTap: () {
            log("Current Player State :$playerState");

            if (playerState == BetterPlayerEventType.playing) {
              FlutterNativeCodeListenerMethodChannel.pause(0);
            } else if (playerState == BetterPlayerEventType.finished){
               FlutterNativeCodeListenerMethodChannel.reStart(0);
            }
            else {
              FlutterNativeCodeListenerMethodChannel.play(0);
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
