import 'package:flutter/material.dart';
import 'package:online_learning_app/models/userInfo.dart';
import 'package:online_learning_app/services/course_service.dart';
import 'package:online_learning_app/services/payment_service.dart';
import 'package:online_learning_app/services/user_service.dart';
import 'package:online_learning_app/video/VidController.dart';
import 'package:provider/provider.dart';

class CourseDetail extends StatefulWidget {
  final dynamic courseData;
  CourseDetail({@required this.courseData});

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  Future<dynamic> _courseDetail;
  Future<dynamic> _likeStatus;
  Future<dynamic> _owningState;

  bool isCourseLiked  ;
  bool isFirstHit = false; // to make sure initialize the favorite state only once

  @override
  void initState(){
    _courseDetail = Course_Service().getCourseDetail(widget.courseData['courseID'], widget.courseData['userID']);
   _likeStatus = User_Service().getLikeStatus(widget.courseData['courseID'], widget.courseData['token']);
   //_owningState = User_Service().checkCourseOwningState(widget.courseData['courseID'], widget.courseData['token']);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    String getContentInArray(List<String>array){
      String content = ' ';
      for(int i = 0;i<array.length;i++ ){
        content += array[i];
      }
      return content;
    }
    
    return FutureBuilder(
      future: Future.wait([
        _courseDetail,
        _likeStatus,
       // _owningState,
      ]),
      builder:(context, snapshot){
        if(snapshot.hasData){
          //print(snapshot.data[2].isUserOwnCourse);
          if(!isFirstHit){
            isCourseLiked = snapshot.data[1].likeStatus;
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Course Detail',),
              actions: [
                FlatButton.icon(
                    onPressed: () async {
                       await User_Service().likeCourse(widget.courseData['courseID'],
                          widget.courseData['token']);
                      setState(() {
                        isFirstHit = true;
                        isCourseLiked = !isCourseLiked;
                      });
                    },

                    icon: isCourseLiked ?
                    Icon(Icons.favorite,color:Colors.red,size: 30.0,) :
                    Icon(Icons.favorite, size: 30.0,),
                    label: Text(''),
                   )

              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.grey[150],
              child: Container(

                height: 90.0,
                child: Row(
                  children: [
                    Text(
                      'Price: ${snapshot.data[0].price}.vnd',
                      style: TextStyle(
                        fontSize: 25.0,
                        color:Colors.lightBlue[700],
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    RaisedButton(
                        onPressed: () async {
                            var res = Payment_Service().buyCourses(widget.courseData['token'], snapshot.data[0].id);
                            print(res);
                        },
                        color: Colors.lightBlue[600],
                        padding: EdgeInsets.fromLTRB(35,15,35,15),
                        child: Text(
                            'Buy now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                    )
                  ],
                ),
              ),
            ),
            body: ListView(
              children: [
                Image(image: NetworkImage(snapshot.data[0].imageUrl)),
                // VidController(
                //   vidUrl: snapshot.data.promoVidUrl,
                // ),
                Text(
                    snapshot.data[0].title,
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
                        Text('Sold Number: ${snapshot.data[0].soldNumber}'),
                      ],
                    ),
                    SizedBox(width: 15.0,),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.yellow[700],),
                        Text('Rated Number: ${snapshot.data[0].ratedNumber}'),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Icon(Icons.timer,color: Colors.blue,),
                    Text('Duration: ${snapshot.data[0].totalHours} hr(s)'),
                  ],
                ),
                SizedBox(height: 10.0,),
                Divider(height: 1.0,color: Colors.grey,),
                SizedBox(height: 10.0,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info),
                          Text(
                            'About this Course',
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          snapshot.data[0].description,
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Divider(height: 1.0,color: Colors.grey,),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.menu_book,color: Colors.blueAccent,),
                          Text(
                            'What you learn',
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          getContentInArray(snapshot.data[0].learnWhat),
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Divider(height: 1.0,color: Colors.grey,),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_fire_department_outlined,color:Colors.orangeAccent),
                          Text(
                            'Requirements',
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        getContentInArray(snapshot.data[0].requirement),
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Divider(height: 1.0,color: Colors.grey,),
                    ],
                  ),
                ),

              ],
              ),
            );
        }

        return CircularProgressIndicator();
      }
    );
  }
}
