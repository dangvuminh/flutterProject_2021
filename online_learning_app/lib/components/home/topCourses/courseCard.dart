import 'package:flutter/material.dart';
import 'package:online_learning_app/models/course.dart';
import 'package:online_learning_app/models/userInfo.dart';
import 'package:online_learning_app/services/course_service.dart';
import 'package:provider/provider.dart';

class CourseCard extends StatelessWidget {
  final Course courseData;
  CourseCard({this.courseData});
  @override
  Widget build(BuildContext context) {

    final UserProfile user = Provider.of<UserProfile>(context);
    return InkWell(
      onTap: ()  async {

        Navigator.pushNamed(
            context, '/courseDetail',
            arguments: {
              'courseID': courseData.id,
              'userID': user.userInfo.id,
            }
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Column(
          children: [
            Image(image: NetworkImage(courseData.imageUrl)),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseData.title,
                          style: TextStyle(
                            fontSize: 23.0,
                          ),
                        ),
                        SizedBox(height: 10.0),

                        Text(
                            courseData.subtitle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.attach_money_rounded,color: Colors.brown,),
                      Text('Sold number: ${courseData.soldNumber}'),
                      SizedBox(height: 10.0),
                      SizedBox(width: 20.0),
                      Icon(Icons.star,color: Colors.yellow[700],),
                      Text('Rated number: ${courseData.ratedNumber}'),
                    ],
                  ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.timer,color: Colors.red,),
                        Text('${courseData.totalHours}h'),
                      ],
                    )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
