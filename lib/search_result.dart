import 'package:flutter/material.dart';
import 'package:mobile_flutter/objects/courseObject.dart';
import 'package:mobile_flutter/minimizedCourseCard.dart';
class SearchResult extends StatelessWidget {
  final List<CourseObject> courses;
  SearchResult({this.courses});

  @override
  Widget build(BuildContext context) {
    return  Container(
      // height: 400.0,
      child: Expanded(
        child: ListView.builder(
            itemCount:   courses.length,
            itemBuilder: ( context,i){
              return MinimizedCourseCard(
                data: courses[i],
              );
            }),
      ),
    );
  }
}
