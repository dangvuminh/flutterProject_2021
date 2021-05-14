import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_learning_app/components/home/account/changeEmail.dart';
import 'package:online_learning_app/components/home/account/changePassword.dart';
import 'package:online_learning_app/components/home/account/profileUpdate.dart';
import 'package:online_learning_app/components/home/courses/courseDetail.dart';
import 'package:online_learning_app/components/home/lessons/lessonDetail.dart';
import 'package:online_learning_app/components/home/lessons/lessonList.dart';
import 'package:online_learning_app/components/home/lessons/sectionList.dart';
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

      case '/sectionList': {
        return MaterialPageRoute(
            builder: (context)=> SectionList(
              courseData: args,
            )
        );
      }
      case '/lessonList': {
        return MaterialPageRoute(
            builder: (context)=> LessonList(
              lessons: args,
            )
        );

      }

      case '/lessonDetail': {
        return MaterialPageRoute(
            builder: (context)=> LessonDetail(
              lesson: args,
            )
        );
      }
      case '/profileUpdate':{
        return MaterialPageRoute(
            builder: (context)=> ProfileUpdate(
              userInfo: args,
            )
        );
      }
      case '/changePassword':{
        return MaterialPageRoute(
            builder: (context)=> ChangePassword(
              userInfo: args,
            )
        );
      }
      case '/changeEmail':{
        return MaterialPageRoute(
            builder: (context)=> ChangeEmail(
              userInfo: args,
            )
        );
      }
    }
  }
}