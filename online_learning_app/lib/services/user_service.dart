import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/models/courseOwningState.dart';
import 'package:online_learning_app/models/favoriteCourse.dart';
import 'package:online_learning_app/models/ownCourse.dart';
import 'package:online_learning_app/models/userInfo.dart';

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

  Future checkCourseOwningState(String courseId,String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };

    try{
      var res = await client.get(
        'http://api.letstudy.org/user/check-own-course/$courseId',
        headers: requestHeaders,
      );

      if(res.statusCode == 200){
        var owningStateData = CourseOwningState.fromJson(json.decode(res.body));
        return owningStateData;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }

  Future getUserInfo(String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };

    try{
      var res = await client.get(
        'http://api.letstudy.org/user/me',
        headers: requestHeaders,
      );

      if(res.statusCode == 200){
        var jsonData = json.decode(res.body);
        var userInfo = UserInfo.fromJson(jsonData['payload']);
        return userInfo;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }

  }

  Future updateProfile(String name,String avatar,String phone ,String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };
    Map<String, String> data = {
      'name': '$name',
      'avatar': '$avatar',
      'phone': '$phone'
    };
    try {
      var res = await client.put(
        'http://api.letstudy.org/user/update-profile',
        body: data,
        headers: requestHeaders,
      );

      if (res.statusCode == 200) {
        var jsonData = json.decode(res.body);
        var userInfo = UserInfo.fromJson(jsonData['payload']);
        return userInfo;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future changPassword(String id,String oldPassword,String newPassword,String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };
    Map<String, String> data = {
      'id': '$id',
      'oldPass': '$oldPassword',
      'newPass': '$newPassword',
    };
    try {
      var res = await client.post(
        'http://api.letstudy.org/user/change-password',
        body: data,
        headers: requestHeaders,
      );

      if (res.statusCode == 200) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future changeEmail(String email,String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };
    Map<String, String> data = {
      'newEmail': '$email',
    };
    try {
      var res = await client.put(
        'http://api.letstudy.org/user/change-user-email',
        body: data,
        headers: requestHeaders,
      );

      if (res.statusCode == 200) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }

  //END_____________________
}