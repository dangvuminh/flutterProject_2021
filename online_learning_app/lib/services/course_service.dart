import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/models/course.dart';
import 'package:online_learning_app/models/courseWithDetail.dart';
import 'package:online_learning_app/models/courseWithLessons.dart';


class Course_Service{
  var client = http.Client();
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future getTopSell() async{

    var reqBody = {
      'limit': 10,
      'page': 1,
    };
    try{
      var res = await client.post(
        'http://api.letstudy.org/course/top-sell',
        headers: requestHeaders,
        body: json.encode(reqBody),
      );
      var courseJson = json.decode(res.body);

      if(res.statusCode == 200){
        List<Course> courseData=[];
         for(int i = 0 ; i<courseJson['payload'].length;i++){
           var course = Course.fromJson(courseJson['payload'][i]);
           courseData.add(course);
         }
        return courseData;
      }
      return null;
    }catch(e){
      print(e);
      return null;
    }

  }

  Future getTopRate() async{

    var reqBody = {
      'limit': 10,
      'page': 1,
    };
    try{
      var res = await client.post(
        'http://api.letstudy.org/course/top-rate',
        headers: requestHeaders,
        body: json.encode(reqBody),
      );
      var courseJson = json.decode(res.body);

      if(res.statusCode == 200){
        List<Course> courseData=[];
        for(int i = 0 ; i<courseJson['payload'].length;i++){
          var course = Course.fromJson(courseJson['payload'][i]);
          courseData.add(course);
        }
        return courseData;
      }
      return null;
    }catch(e){
      print(e);
      return null;
    }

  }

  Future getTopNew() async{


    var reqBody = {
      'limit': 10,
      'page': 1,
    };
    try{
      var res = await client.post(
        'http://api.letstudy.org/course/top-new',
        headers: requestHeaders,
        body: json.encode(reqBody),
      );
      var courseJson = json.decode(res.body);

      if(res.statusCode == 200){
        List<Course> courseData=[];
        for(int i = 0 ; i<courseJson['payload'].length;i++){
          var course = Course.fromJson(courseJson['payload'][i]);
          courseData.add(course);
        }
        return courseData;
      }
      return null;
    }catch(e){
      print(e);
      return null;
    }

  }

  Future getCourseDetail(String id,String userId) async {
    try{
      var res = await client.get(
        'http://api.letstudy.org/course/get-course-detail/$id/$userId',
      );
      var courseJson = json.decode(res.body);
      if(res.statusCode == 200){
        var courseData = Course.fromJson(courseJson['payload']);
        return courseData;
      }
      return null;
    }catch(e){
      print(e);
      return null;
    }

  }

  Future getLessonInCourse(String courseId,String bearer) async {
    Map<String, String> bearerHeader = {
      'Authorization': 'Bearer $bearer'
    };
    try{
      var res = await client.get(
        'http://api.letstudy.org/course/detail-with-lesson/$courseId',
        headers: bearerHeader,
      );
      var courseJson = json.decode(res.body);
      if(res.statusCode == 200){

        var courseData = CourseWithLessons.fromJson(courseJson['payload']);
        print(courseData);
        return courseData;
      }
      return null;
  }catch(e){
      print(e);
      return null;
    }
    }

// ____________________ END________________
}