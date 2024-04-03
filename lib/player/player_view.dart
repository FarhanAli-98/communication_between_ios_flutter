import 'package:flutter/material.dart';

const playerSwiftUiView = 'NativeView';

class PlayerSwiftView extends StatefulWidget {
  const PlayerSwiftView({super.key, required this.link, required this.thumbnail});
  final String link;
  final String thumbnail;

  @override
  State<PlayerSwiftView> createState() => _PlayerSwiftViewState();
}

class _PlayerSwiftViewState extends State<PlayerSwiftView> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child:  Padding(
      padding: EdgeInsets.all(8.0),
      child: UiKitView(viewType: playerSwiftUiView),
    ));
  }
}
