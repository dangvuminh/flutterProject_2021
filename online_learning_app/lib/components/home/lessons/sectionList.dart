import 'package:flutter/material.dart';
import 'package:online_learning_app/services/course_service.dart';
import 'package:online_learning_app/sharedTemplate/functions/sharedFunctions.dart';

class SectionList extends StatefulWidget {
  final dynamic courseData;
  SectionList({@required this.courseData});

  @override
  _SectionListState createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> {
  Future<dynamic> _lessonList ;
  @override
  void initState(){
    _lessonList = Course_Service().getSectionInCourse(widget.courseData['courseID'],
        widget.courseData['token']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
                                width: 250.0,
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
                        Text('Course Sections',style:TextStyle(fontSize: 25.0)),
                        Container(
                          padding: EdgeInsets.all(30.0),
                          child: GridView.builder(
                              shrinkWrap: true,// resize the same size as parent
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              itemCount: snapshot.data.section.length,
                              itemBuilder: (context,index){
                                return InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/lessonList',
                                        arguments: {
                                          'courseID': snapshot.data.id,
                                          'lessons':snapshot.data.section[index].lesson,
                                        }
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Row(
                                      children: [
                                      Container(
                                      height: 100.0,
                                      width: 3.0,
                                      color: SharedFunctions().getRandomColorWidget(index,1)
                                    ),
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
                                            Text('${snapshot.data.section[index].sumHours.roundToDouble()} hr(s)'),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              }),
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
