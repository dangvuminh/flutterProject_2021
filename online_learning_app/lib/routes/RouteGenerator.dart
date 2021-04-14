import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_learning_app/components/home/courses/courseDetail.dart';
import 'package:online_learning_app/components/home/home.dart';
import 'package:online_learning_app/components/home/lessons/lessonList.dart';
import 'package:online_learning_app/components/wrapper.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context)=> Wrapper());
      case '/courseDetail':
        return MaterialPageRoute(
            builder: (context)=> CourseDetail(
              courseData : args,
            )
        );

      case '/lessonList': {
        return MaterialPageRoute(
            builder: (context)=> LessonList(
              courseData: args,
            )
        );
      }
    }
  }
}