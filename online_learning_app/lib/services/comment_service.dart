import 'dart:convert';
import 'package:http/http.dart' as http;

class Comment_Service{
  var client = http.Client();
  Future getRating(String courseID,String token) async {
    Map<String,String> bearerToken = {
        'Authorization':'Bearer $token',
    };
    try{
      var res = await client.get(
        'http://api.letstudy.org/course/get-rating/$courseID',
        headers: bearerToken,
      );
    }
    catch(e){
      print(e);
      return null;
    }

  }
}