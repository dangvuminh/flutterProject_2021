import 'package:flutter/material.dart';
import 'package:online_learning_app/services/lesson_service.dart';
import 'package:online_learning_app/services/video_service.dart';
import 'package:online_learning_app/video/youtubeVideo.dart';

class LessonDetail extends StatefulWidget {
  final dynamic lesson;
  LessonDetail({@required this.lesson});

  @override
  _LessonDetailState createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  Future<dynamic> _lessonDetail;
  Future<dynamic> _video;
  @override
  void initState(){
    _lessonDetail = Lesson_Service().getLessonDetail(widget.lesson['courseID'],
        widget.lesson['lessonID'],widget.lesson['token']);
    _video = Video_Service().getLessonVideo(widget.lesson['courseID'],
        widget.lesson['lessonID'],widget.lesson['token']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget followingLesson(String prevLesson,String nextLesson){
      if(prevLesson == 'null' && nextLesson != 'null'){
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _lessonDetail =  Lesson_Service().getLessonDetail(widget.lesson['courseID'],
                      nextLesson, widget.lesson['token']);
                  _video =  Video_Service().getLessonVideo(widget.lesson['courseID'],
                      nextLesson,widget.lesson['token']);
                });
              },
              child: Container(
                height: 70.0,
                width: 150.0,
                child: Card(
                  child: Column(
                    children: [
                      Text('Next Lesson'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      } else if(nextLesson == 'null' && prevLesson != 'null'){
        return Row(
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  _lessonDetail = Lesson_Service().getLessonDetail(widget.lesson['courseID'],
                      prevLesson, widget.lesson['token']);
                  _video = Video_Service().getLessonVideo(widget.lesson['courseID'],
                      prevLesson,widget.lesson['token']);
                });
              },
              child: Container(
                height: 70.0,
                width: 150.0,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Previous Lesson'),
                      Icon(Icons.arrow_back),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      } else {
        return Row(
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  _lessonDetail = Lesson_Service().getLessonDetail(widget.lesson['courseID'],
                      prevLesson, widget.lesson['token']);
                  _video = Video_Service().getLessonVideo(widget.lesson['courseID'],
                      prevLesson,widget.lesson['token']);
                });
              },
              child: Container(
                height: 70.0,
                width: 150.0,
                child: Card(
                  child: Column(
                    children: [
                      Text('Previous Lesson'),
                      Icon(Icons.arrow_back),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: (){
                setState(() {
                  _lessonDetail = Lesson_Service().getLessonDetail(widget.lesson['courseID'],
                      nextLesson, widget.lesson['token']);
                  _video = Video_Service().getLessonVideo(widget.lesson['courseID'],
                      nextLesson,widget.lesson['token']);
                });
              },
              child: Container(
                height: 70.0,
                width: 150.0,
                child: Card(
                  child: Column(
                    children: [
                      Text('Next Lesson'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }
    }
    return FutureBuilder(
        future: Future.wait([
          _lessonDetail,
          _video,
        ]),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Scaffold(
              appBar: AppBar(
                title: Text('Lesson Detail'),
              ),
              body: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                        snapshot.data[0].name,
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                    ),
                    YoutubeVideo(vidUrl:snapshot.data[1].videoUrl),
                    Text(snapshot.data[0].content),

                    followingLesson(snapshot.data[0].prevLessonId,snapshot.data[0].nextLessonId),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(title: Text('Loading...'),),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
    );
  }
}
