import 'package:flutter/material.dart';
import 'package:online_learning_app/sharedTemplate/courseCard.dart';
import 'package:online_learning_app/services/course_service.dart';

class TopNewCourses extends StatefulWidget {
  @override
  _TopNewCoursesState createState() => _TopNewCoursesState();
}

class _TopNewCoursesState extends State<TopNewCourses> {
  Future<dynamic> _courseModel;

  @override
  void initState(){
    _courseModel = Course_Service().getTopNew();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<dynamic>(
          future: _courseModel,
          builder:(context,snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount:snapshot.data.length ,
                  itemBuilder: ( context, index){
                    var course = snapshot.data[index];
                    return CourseCard(
                      courseData:snapshot.data[index],
                    );
                  }
              );
            }

            return CircularProgressIndicator();
          }

      ),
    );
  }
}
