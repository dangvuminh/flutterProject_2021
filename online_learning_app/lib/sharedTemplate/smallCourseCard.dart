import 'package:flutter/material.dart';
import 'package:online_learning_app/models/favoriteCourse.dart';

class SmallCourseCard extends StatelessWidget {
  final FavoriteCourse courseData;
  SmallCourseCard({this.courseData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
              height: 70.0,
              child: Image(image: NetworkImage(courseData.courseImage))
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(courseData.courseTitle),
                Row(
                  children: [
                    Icon(Icons.person),
                    Text(courseData.instructorName),
                  ],
                ),
                Row(
                  children: [
                    Text('Sold number: ${courseData.courseSoldNumber}'),
                    SizedBox(width: 10.0,),
                    Text('Sold number: ${courseData.courseAveragePoint}'),
                  ],
                )

              ],
            ),
          )
        ],
      )
    );
  }
}
