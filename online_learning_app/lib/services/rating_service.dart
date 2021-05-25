import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/models/RatingModel.dart';

class Rating_Service{
  var client = http.Client();

  Future getRating(String courseID, String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };
      try{
        var res = await client.get(
            'http://api.letstudy.org/course/get-rating/$courseID',
            headers: requestHeaders
        );
        if(res.statusCode == 200){
          var jsonData = json.decode(res.body);
          var rating = Rating.fromJson(jsonData['payload']);
          return rating;
        }
        return null;
      }catch(err){
        print(err);
        return null;
      }

  }

  Future rateCourse(String courseID,int formalityPoint,int contentPoint,int presentationPoint,String content, String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };

    Map<String,String> data = {
      "courseId": courseID,
      "formalityPoint": '$formalityPoint',
      "contentPoint": '$contentPoint',
      "presentationPoint": '$presentationPoint',
      "content": '$content'
    };

    var res = await client.post(
        'http://api.letstudy.org/course/rating-course'
    );
  }
}