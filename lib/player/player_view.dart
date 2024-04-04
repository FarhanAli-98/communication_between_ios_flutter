import 'package:flutter/material.dart';
import 'package:prototype/FlutterMethodChannel.dart';

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
  void initState() {
    super.initState();
    initializeNativePlayerController();
  }

  initializeNativePlayerController() async {
    await FlutterNativeCodeListenerMethodChannel.buildPlayerController(widget.link, widget.thumbnail, widget.looping, widget.autoPlay, widget.cacheConfiguration);
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: UiKitView(viewType: playerSwiftUiView),
    ));
  }
}
