import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/models/lessonDetail.dart';

class Lesson_Service{
  var client = http.Client();

  Future<dynamic> getLessonDetail(String courseId,String lessonId,String bearer) async {
    Map<String, String> bearerHeader = {
      'Authorization': 'Bearer $bearer'
    };

    try{
      var res = await client.get(
        'http://api.letstudy.org/lesson/detail/$courseId/$lessonId',
        headers: bearerHeader
      );
      if(res.statusCode == 200){
        var jsonData = json.decode(res.body);
        return LessonDetail.fromJson(jsonData['payload']);
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }

  }
}