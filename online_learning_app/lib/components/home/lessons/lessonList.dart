import'package:flutter/material.dart';
import 'package:online_learning_app/services/course_service.dart';
import 'package:online_learning_app/services/user_service.dart';
import 'dart:math';

class LessonList extends StatefulWidget {
  final dynamic courseData;
  LessonList({@required this.courseData});

  @override
  _LessonListState createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  
   Future<dynamic> _lessonList ;
  @override
  void initState(){
    _lessonList = Course_Service().getLessonInCourse(widget.courseData['courseID'], widget.courseData['token']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget getRandomColorWidget(index){
      int randomNumber = Random().nextInt(3) +6  ;
      print(randomNumber);
        if(index == 0){
          return Container(
            height: 100.0,
            width: 3.0,
            color: Colors.red[randomNumber*100],
          );
        } else if(index == 1){
          return Container(
            height: 100.0,
            width: 3.0,
            color: Colors.blue[randomNumber*100],
          );
        } else if(index == 2){
          return Container(
            height: 100.0,
            width: 3.0,
            color: Colors.green[randomNumber*100],
          );
        } else {
          return Container(
            height: 100.0,
            width: 3.0,
            color: Colors.orangeAccent[randomNumber*100],
          );
        }
    }

    return FutureBuilder(
        future: _lessonList,
        builder: (context,snapshot) {
          if(snapshot.hasData){
            return Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                title: Text('My school hall'),
              ),
              body: ListView(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Image(
                            image: NetworkImage(snapshot.data.imageUrl),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 240.0),
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Text(
                                snapshot.data.title,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      Container(
                          margin: EdgeInsets.only(top:15.0,bottom:15.0),
                          width: 320.0,
                          child: IgnorePointer( //  unscrolling the grid
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              crossAxisCount: 3,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  padding: EdgeInsets.only(top:25),
                                  child: Column(
                                    children: [
                                      Icon(Icons.timer),
                                      Text('${snapshot.data.totalHours.roundToDouble()} hrs')
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  padding: EdgeInsets.only(top:25),
                                  child: Column(
                                    children: [
                                      Icon(Icons.video_collection_outlined),
                                      Text('${snapshot.data.videoNumber} videos')
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  padding: EdgeInsets.only(top:25),
                                  child: Column(
                                    children: [
                                      Icon(Icons.check_circle_outline),
                                      Text('${snapshot.data.status} ')
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  padding: EdgeInsets.only(top:25),
                                  child: Column(
                                    children: [
                                      Icon(Icons.person),
                                      Text('Teacher'),
                                      Text('${snapshot.data.instructorName}')
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ), padding: EdgeInsets.only(top:25),

                                  child: Column(
                                    children: [
                                      Icon(Icons.people_alt),
                                      Text(' ${snapshot.data.soldNumber} students')
                                    ],
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  padding: EdgeInsets.only(top:25),
                                  child: Column(
                                    children: [
                                      Icon(Icons.sticky_note_2_outlined),
                                      Text(' ${snapshot.data.section.length} sections')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      ),

                      Divider(color: Colors.grey,),
                      Text('Course Content',style:TextStyle(fontSize: 25.0)),
                      Container(
                        padding: EdgeInsets.all(30.0),
                        child: IgnorePointer(
                          child: GridView.builder(
                            shrinkWrap: true,// resize the same size as parent
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              itemCount: snapshot.data.section.length,
                              itemBuilder: (context,index){
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    children: [
                                      getRandomColorWidget(index),
                                      SizedBox(width:10.0),
                                      Column(
                                        children: [
                                          SizedBox(height: 40.0,),
                                          Container(
                                              width: 100.0,
                                              child: Text(snapshot.data.section[index].name,
                                                style: TextStyle(fontSize: 20.0),)
                                          ),
                                          SizedBox(height: 10.0),
                                          Text('${snapshot.data.section[index].sumHours.roundToDouble()} hrs'),
                                        ],
                                      ),

                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ],
              )


            );
          }
          return Scaffold(appBar:AppBar(),body: CircularProgressIndicator());
        }
    );
  }
}
