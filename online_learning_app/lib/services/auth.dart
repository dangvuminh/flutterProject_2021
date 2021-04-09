import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_learning_app/models/user.dart';
import 'package:online_learning_app/models/userInfo.dart';
import 'package:online_learning_app/models/userLogIn.dart';

class Auth {
   var client = http.Client();
  Future signUp(String username,String email,String phone,String password) async {
    try{
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      User userData = new User(username:username,email: email,phone: phone,password: password);
      var userString = json.encode(userData.toJson());
      // print(userString);
      var res = await client.post(
        'http://api.letstudy.org/user/register',
        headers: requestHeaders,
        body: userString,
      );
      print(res.statusCode);
      if(res.statusCode == 200){
        // when legally created
        return userData;
      } else{
        //when the user already exists
        print('Existed username');
        return null;
      }

    } catch(e){
      print(e);
      return null;
    }
  }

  Future sendActivateEmail(String email) async {
    try{
      print('Vo roi ');
      var res =  await client.post(
        'http://api.letstudy.org/user/send-activate-email',
        body: email,
      );
      print(res.statusCode);
      if(res.statusCode == 200){
        print(res.body);
        return res.body;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }

  Future login(String email,String password) async {
      try{
        Map<String, String> requestHeaders = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
          UserLogIn userData = new UserLogIn(email: email,password: password);
          var userString = json.encode(userData.toJson());
          var res = await client.post(
            'http://api.letstudy.org/user/login',
            headers: requestHeaders,
            body: userString,
          );
          print(res.statusCode);
          if(res.statusCode == 200){
            print('Success Log In');

            var userProfile =  UserProfile.fromJson(json.decode(res.body));

            return userProfile;
          } else {
            print('Failed to Log in');
            return null;
          }
      }catch(e){
        print(e);
        return null;
      }
  }
}