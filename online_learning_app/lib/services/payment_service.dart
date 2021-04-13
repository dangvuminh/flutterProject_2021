import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/models/payment.dart';

class Payment_Service {
  var client = http.Client();
  Future buyCourses(String token,String courseId) async {
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
    };
    Map<String, String> data = {
      'courseId': '$courseId'
    };

    try{
      var res = await client.post(
        'http://api.letstudy.org/payment/get-free-courses',
        headers: requestHeaders,
        body:data,
      );

      if(res.statusCode == 200) {
       var data = Payment.fromJson(json.decode(res.body));
       return data;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }

  //_________________END__________
}