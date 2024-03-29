import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/models/course.dart';
import 'package:online_learning_app/models/courseWithLessons.dart';
import 'package:online_learning_app/models/searchHistory.dart';
import 'package:online_learning_app/models/searchedCourse.dart';


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

  Future getSectionInCourse(String courseId,String bearer) async {
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
        return courseData;
      }
      return null;
  }catch(e){
      print(e);
      return null;
    }
    }

    Future searchCourse(String keyword) async {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
     var data = {
        "keyword": "$keyword",
        "limit": 10,
        "offset": 1,
        "opt": {
          "sort": {
            "attribute": "price",
            "rule": "ASC"
          },
          "category": [
          ],
          "time": [
            {
              "min": 0,
              "max": 1
            },
            {
              "min": 3,
              "max": 6
            }
          ],
          "price": [
            {
              "max": 0
            },
            {
              "min": 0,
              "max": 200000
            },
            {
              "min": 500000,
              "max": 1000000
            }
          ]
        }
      };
     try{
       var res = await client.post(
           'http://115.78.232.219:3100/course/search',
           body: json.encode(data),
           headers: requestHeaders
       );
       print(res.statusCode);
       if(res.statusCode == 200){
         List<SearchedCourse> courseList = [];
         var jsonData = json.decode(res.body);

         for(int i = 0 ; i < jsonData['payload']['rows'].length ; i++){
           courseList.add(SearchedCourse.fromJson(jsonData['payload']['rows'][i]));
         }
         return courseList;
       }
       return null;
     }catch(e){
       print(e);
       return null;
     }

    }

    Future getSearchHistory(String bearer) async{
      Map<String, String> bearerHeader = {
        'Authorization': 'Bearer $bearer'
      };
      try{
        var res = await client.get(
          'http://115.78.232.219:3100/course/search-history',
          headers: bearerHeader
        );
        if(res.statusCode == 200){
          List<SearchHistory> list = [];
          var jsonData = json.decode(res.body);
          if(jsonData['payload']['data'] != null){
            for(int i = 0 ; i<jsonData['payload']['data'].length; i++){
              list.add(SearchHistory.fromJson(jsonData['payload']['data'][i]));
            }
            return list;
          }

        }
        return null;
      }catch(err){
        print(err);
        return null;
      }
    }

// ____________________ END________________
}