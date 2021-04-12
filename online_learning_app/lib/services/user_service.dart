import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/models/favoriteCourse.dart';
import 'package:online_learning_app/models/ownCourse.dart';

class LikeStatus{
  bool likeStatus;
  String message;
  LikeStatus({this.message,this.likeStatus});

  factory LikeStatus.fromJson(Map<String, dynamic> json) => LikeStatus(
      message: json['message'],
      likeStatus: json['likeStatus'],
  );
}

class User_Service{
  var client = http.Client();

  Future likeCourse(String courseId,String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };
    Map<String, String> data = {
      'courseId': '$courseId'
    };
    try{
      var res = await client.post(
        'http://api.letstudy.org/user/like-course',
        body:data,
        headers: requestHeaders,
      );
      var dataJson = json.decode(res.body);
      if(res.statusCode == 200){
      var likeStatusData = LikeStatus.fromJson(dataJson);
      return likeStatusData;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }

  Future getLikeStatus(String courseId,String token) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try{
      var res = await client.get(
        'http://api.letstudy.org/user/get-course-like-status/$courseId',
        headers: requestHeaders,
      );
      var dataJson = json.decode(res.body);
      if(res.statusCode == 200){
        var likeStatusData = LikeStatus.fromJson(dataJson);
        return likeStatusData;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }

  Future getFavoriteCourses(String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };

    try{
      var res = await client.get(
        'http://api.letstudy.org/user/get-favorite-courses',
        headers: requestHeaders,
      );
      var courseJson = json.decode(res.body);

      if(res.statusCode == 200) {
        List<FavoriteCourse> courseData = [];
        for (int i = 0; i < courseJson['payload'].length; i++) {
          var course = FavoriteCourse.fromJson(courseJson['payload'][i]);
          courseData.add(course);
        }
      return courseData;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }


  Future getOwnCourses(String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };

    try{
      var res = await client.get(
        'http://api.letstudy.org/user/get-process-courses',
        headers: requestHeaders,
      );
      var courseJson = json.decode(res.body);

      if(res.statusCode == 200) {
        List<OwnCourse> courseData = [];
        for (int i = 0; i < courseJson['payload'].length; i++) {
          var course = OwnCourse.fromJson(courseJson['payload'][i]);
          courseData.add(course);
        }
        return courseData;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }
  //END_____________________
}