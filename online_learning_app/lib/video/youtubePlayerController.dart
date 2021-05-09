import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class YoutubePlayerController extends StatefulWidget {
  @override
  _YoutubePlayerControllerState createState() => _YoutubePlayerControllerState();
}

class _YoutubePlayerControllerState extends State<YoutubePlayerController> {
  YoutubePlayerController _controller;
  void runYoutubeVideo(){
    _controller = YoutubePlayerController(
      //initialVideoId: ""
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
