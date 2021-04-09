import 'dart:convert';

import 'package:flutter/cupertino.dart';

UserLogIn userFromJson(String str) => UserLogIn.fromJson(json.decode(str));

String userToJson(UserLogIn data) => json.encode(data.toJson());

class UserLogIn extends ChangeNotifier{
  UserLogIn({
    this.email,
    this.password,
  });


  String email;
  String password;


  factory UserLogIn.fromJson(Map<String, dynamic> json) => UserLogIn(
    email: json["email"],
    password: json["password"],
  );


  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
