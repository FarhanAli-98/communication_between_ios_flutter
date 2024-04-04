import 'package:flutter/material.dart';
import 'package:prototype/player/player_view.dart';
import 'package:prototype/player/video_model.dart';

class QuestionsBuilder extends StatefulWidget {
  const QuestionsBuilder({Key? key}) : super(key: key);

  @override
  State<QuestionsBuilder> createState() => _QuestionsBuilderState();
}

class _QuestionsBuilderState extends State<QuestionsBuilder> with WidgetsBindingObserver {
  List<VideoViewModel> listOfVideos = [];

  @override
  void initState() {
    super.initState();
    listOfVideos = addDataToVideoView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: PageView.builder(
            itemCount: listOfVideos.length,
            scrollDirection: Axis.vertical,
            onPageChanged: (ind) async {},
            itemBuilder: (context, index) {
              return PlayerSwiftView(
                link: listOfVideos[index].url,
                thumbnail: listOfVideos[index].thumbnail,
                autoPlay: true,
                cacheConfiguration: true,
                looping: true,
              );
            }));
  }
}
