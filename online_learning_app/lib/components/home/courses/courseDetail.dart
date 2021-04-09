import 'package:flutter/material.dart';
import 'package:online_learning_app/services/course_service.dart';
import 'package:online_learning_app/video/VidController.dart';

class CourseDetail extends StatefulWidget {
  final dynamic courseData;
  CourseDetail({@required this.courseData});
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  Future<dynamic> _courseDetail;
  @override
  void initState(){
    _courseDetail = Course_Service().getCourseDetail(widget.courseData['courseID'], widget.courseData['userID']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _courseDetail,
      builder:(context,snapshot){
        if(snapshot.hasData){
          print(snapshot.data.title);
          return Scaffold(
            appBar: AppBar(
              title: Text('Course Detail',),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Container(
                height: 90.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '\$${snapshot.data.price}',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    Row(
                      children: [
                        RaisedButton(
                            onPressed: (){

                            },
                            child: Text('Buy now'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            body: Container(

              child: Column(
                children: [
                  Image(image: NetworkImage(snapshot.data.imageUrl)),
                  // VidController(
                  //   vidUrl: snapshot.data.promoVidUrl,
                  // ),
                  Text(
                      snapshot.data.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                      )
                  ),

                  SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.attach_money_rounded,color: Colors.red,),
                          Text('Sold Number: ${snapshot.data.soldNumber}'),
                        ],
                      ),
                      SizedBox(width: 15.0,),
                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow[700],),
                          Text('Rated Number: ${snapshot.data.ratedNumber}'),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Icon(Icons.timer,color: Colors.blue,),
                      Text('Duration: ${snapshot.data.totalHours} hr(s)'),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Divider(height: 1.0,color: Colors.grey,),
                  SizedBox(height: 10.0,),

                ],
              ),
            ),
            // }
            // return CircularProgressIndicator();
            //),
          );
        }

        return CircularProgressIndicator();
      }
    );
  }
}
