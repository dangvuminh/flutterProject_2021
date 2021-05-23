// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Rating ratingFromJson(String str) => Rating.fromJson(json.decode(str));

String ratingToJson(Rating data) => json.encode(data.toJson());

class Rating {
  Rating({
    this.id,
    this.userId,
    this.courseId,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.content,
    this.updatedAt,
    this.createdAt,
  });

  String id;
  String userId;
  String courseId;
  int formalityPoint;
  int contentPoint;
  int presentationPoint;
  String content;
  DateTime updatedAt;
  DateTime createdAt;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    id: json["id"],
    userId: json["userId"],
    courseId: json["courseId"],
    formalityPoint: json["formalityPoint"].toInt(),
    contentPoint: json["contentPoint"].toInt(),
    presentationPoint: json["presentationPoint"].toInt(),
    content: json["content"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "courseId": courseId,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint,
    "presentationPoint": presentationPoint,
    "content": content,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
  };
}
