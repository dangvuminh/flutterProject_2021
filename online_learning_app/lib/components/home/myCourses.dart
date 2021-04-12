import 'package:flutter/material.dart';
import 'package:online_learning_app/models/favoriteCourse.dart';
import 'package:online_learning_app/models/userInfo.dart';
import 'package:online_learning_app/services/user_service.dart';
import 'package:online_learning_app/sharedTemplate/smallCourseCard.dart';
import 'package:provider/provider.dart';

class MyCourses extends StatefulWidget {
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
   List<FavoriteCourse> courseList = [] ;
   bool isFavoriteHit = false;

  @override
  Widget build(BuildContext context) {
    final UserProfile user = Provider.of<UserProfile>(context);

    void deleteFavorite(String courseId) async {
      await User_Service().likeCourse(courseId, user.token);
      var res = await User_Service().getFavoriteCourses(user.token);
      setState(() {
        courseList = res;
      });
    }
    Widget getCourseList(List<FavoriteCourse> courseList){
      if(courseList != null && isFavoriteHit == true){
        return Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: courseList.length,
                itemBuilder: (context,index){
                    return SmallCourseCard(
                      courseData: courseList[index],
                      deleteFavorite: deleteFavorite,
                    );
                }
            ),
          ),
        );
      }
      return Container();
    }

    return Column(
      children:[
        FlatButton(
          color: Colors.grey[300],
          height: 90.0,
          //width:
          onPressed: () async {
            var res = await User_Service().getFavoriteCourses(user.token);
            setState(() {
              courseList = res;
              isFavoriteHit = !isFavoriteHit;
            });
          },
          child: Row(
            children: [
              Text(
                'My favorite courses',
                style: TextStyle(
                    fontSize: 25.0
                ),
              ),
              Expanded(child: Container()),
              isFavoriteHit ? Icon(Icons.arrow_drop_down_sharp,size: 35.0,) :
              Icon(Icons.arrow_right,size: 35.0,)
            ],
          ),
        ),
       getCourseList(courseList),
      ]
    );
  }
}
