import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VidController extends StatefulWidget {
  final String vidUrl;
  VidController({this.vidUrl});
  @override
  _VidControllerState createState() => _VidControllerState();
}

class _VidControllerState extends State<VidController> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.vidUrl);
    _initializeVideoPlayer = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayer,
      builder:(context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return Column(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  icon: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                       color: Colors.black,
                  ),
                  label: Text('Play Video'))
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      }
    );
  }

}

