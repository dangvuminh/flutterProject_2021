import 'package:flutter/material.dart';
import 'package:online_learning_app/models/ownCourse.dart';

class SmallCourseCard2 extends StatefulWidget {
  final OwnCourse courseData;

  SmallCourseCard2({this.courseData});
  @override
  _SmallCourseCard2State createState() => _SmallCourseCard2State();
}

class _SmallCourseCard2State extends State<SmallCourseCard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Text('Total: ${widget.courseData.total}'),
                      SizedBox(width: 10.0,),
                      Text('Learned Lesson: ${widget.courseData.learnLesson}'),
                    ],
                  )

                ],
              ),
            ),
          ],
        )
    );
  }
}
