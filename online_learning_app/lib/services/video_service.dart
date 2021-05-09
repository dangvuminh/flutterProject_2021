import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/models/videoModel.dart';

class Video_Service{
  var client = http.Client();

  Future getLessonVideo(String courseID,String lessonID,String bearer) async {

    Map<String, String> bearerHeader = {
      'Authorization': 'Bearer $bearer'
    };
    try{
      var res = await client.get(
          'http://api.letstudy.org/lesson/video/$courseID/$lessonID',
          headers: bearerHeader
      );
      if(res.statusCode == 200){
        var jsonData = json.decode(res.body);
        return Video.fromJson(jsonData['payload']);
      }
      return null;
    }
    catch(e){
      print(e);
      return null;
    }

  }
}