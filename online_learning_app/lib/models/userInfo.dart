// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    this.message,
    this.userInfo,
    this.token,
  });

  String message;
  UserInfo userInfo;
  String token;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    message: json["message"],
    userInfo: UserInfo.fromJson(json["userInfo"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "userInfo": userInfo.toJson(),
    "token": token,
  };
}

class UserInfo {
  UserInfo({
    this.id,
    this.email,
    this.avatar,
    this.name,
    this.favoriteCategories,
    this.phone,
    this.type,
    this.isDeleted,
    this.isActivated,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String email;
  String avatar;
  String name;
  List<String> favoriteCategories;
  String phone;
  String type;
  bool isDeleted;
  bool isActivated;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    email: json["email"],
    avatar: json["avatar"],
    name: json["name"],
    favoriteCategories: List<String>.from(json["favoriteCategories"].map((x) => x)),
    phone: json["phone"],
    type: json["type"],
    isDeleted: json["isDeleted"],
    isActivated: json["isActivated"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "avatar": avatar,
    "name": name,
    "favoriteCategories": List<dynamic>.from(favoriteCategories.map((x) => x)),
    "phone": phone,
    "type": type,
    "isDeleted": isDeleted,
    "isActivated": isActivated,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
