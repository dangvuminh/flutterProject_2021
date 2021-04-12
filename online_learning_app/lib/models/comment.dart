// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  Comment({
    this.id,
    this.userId,
    this.courseId,
    this.content,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String userId;
  String courseId;
  String content;
  int formalityPoint;
  int contentPoint;
  int presentationPoint;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    userId: json["userId"],
    courseId: json["courseId"],
    content: json["content"],
    formalityPoint: json["formalityPoint"]== null ? 0 : json['price'].toInt(),
    contentPoint: json["contentPoint"]== null ? 0 : json['price'].toInt(),
    presentationPoint: json["presentationPoint"]== null ? 0 : json['price'].toInt(),
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "courseId": courseId,
    "content": content,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint,
    "presentationPoint": presentationPoint,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
