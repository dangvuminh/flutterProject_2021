import 'package:flutter/material.dart';
import 'package:online_learning_app/models/favoriteCourse.dart';
import 'package:online_learning_app/models/userInfo.dart';
import 'package:online_learning_app/services/user_service.dart';
import 'package:provider/provider.dart';

class SmallCourseCard extends StatefulWidget {
  final FavoriteCourse courseData;
  final Function deleteFavorite;
  SmallCourseCard({this.courseData,this.deleteFavorite});

  @override
  _SmallCourseCardState createState() => _SmallCourseCardState();
}

class _SmallCourseCardState extends State<SmallCourseCard> {
  @override
  Widget build(BuildContext context) {
    UserProfile user = Provider.of<UserProfile>(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context, '/courseDetail',
            arguments: {
              'courseID': widget.courseData.id,
              'userID': user.userInfo.id,
              'token': user.token,
            }
        );
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 10.0),
          padding: EdgeInsets.all(10.0),
          color: Colors.grey[200],
        child: Row(
          children: [
            Container(
                height: 70.0,
                child: Image(
                    image: NetworkImage(widget.courseData.courseImage),
                    width: 120.0,
                )
            ),
            Container(
              padding: EdgeInsets.only(left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width:250.0,
                      child: Text(widget.courseData.courseTitle)
                  ),
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text(widget.courseData.instructorName),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Sold number: ${widget.courseData.courseSoldNumber}'),
                      SizedBox(width: 10.0,),
                      Text('Sold number: ${widget.courseData.courseAveragePoint}'),
                    ],
                  )

                ],
              ),
            ),
            Expanded(child: Container()),
            Column(
              children: [
                InkWell(
                    child: Icon(Icons.delete),
                  onTap: () async {
                     await widget.deleteFavorite(widget.courseData.id);
                  },
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
