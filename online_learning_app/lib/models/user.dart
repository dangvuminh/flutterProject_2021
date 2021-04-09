// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User extends ChangeNotifier{
  User({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.password,
  });


  String id;
  String username;
  String email;
  String phone;
  String password;


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
  );


  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "phone": phone,
    "password": password,
  };
}
