import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatefulWidget {
  String vidUrl;
  YoutubeVideo({this.vidUrl});
  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {

  String vidId;
  @override
  Widget build(BuildContext context) {
    vidId = YoutubePlayer.convertUrlToId(widget.vidUrl);
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: vidId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );


    return Container(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
          ),
          builder: (context,player){
            return Container(
              child: player,
            );
          },
        ),
    );
  }
}
