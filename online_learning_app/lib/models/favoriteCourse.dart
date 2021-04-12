// To parse this JSON data, do
//
//     final favoriteCourse = favoriteCourseFromJson(jsonString);

import 'dart:convert';

FavoriteCourse favoriteCourseFromJson(String str) => FavoriteCourse.fromJson(json.decode(str));

String favoriteCourseToJson(FavoriteCourse data) => json.encode(data.toJson());

class FavoriteCourse {
  FavoriteCourse({
    this.id,
    this.courseTitle,
    this.coursePrice,
    this.courseImage,
    this.instructorId,
    this.instructorName,
    this.courseSoldNumber,
    this.courseContentPoint,
    this.courseFormalityPoint,
    this.coursePresentationPoint,
    this.courseAveragePoint,
  });

  String id;
  String courseTitle;
  int coursePrice;
  String courseImage;
  String instructorId;
  String instructorName;
  int courseSoldNumber;
  double courseContentPoint;
  double courseFormalityPoint;
  double coursePresentationPoint;
  double courseAveragePoint;

  factory FavoriteCourse.fromJson(Map<String, dynamic> json) => FavoriteCourse(
    id: json["id"],
    courseTitle: json["courseTitle"],
    coursePrice: json["coursePrice"] == null ? 0 : json['coursePrice'].toInt(),
    courseImage: json["courseImage"],
    instructorId: json["instructorId"],
    instructorName: json["instructorName"],
    courseSoldNumber: json["courseSoldNumber"] == null ? 0 : json['courseSoldNumber'].toInt(),
    courseContentPoint: json["courseContentPoint"].toDouble(),
    courseFormalityPoint: json["courseFormalityPoint"].toDouble(),
    coursePresentationPoint: json["coursePresentationPoint"].toDouble(),
    courseAveragePoint: json["courseAveragePoint"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courseTitle": courseTitle,
    "coursePrice": coursePrice,
    "courseImage": courseImage,
    "instructorId": instructorId,
    "instructorName": instructorName,
    "courseSoldNumber": courseSoldNumber,
    "courseContentPoint": courseContentPoint,
    "courseFormalityPoint": courseFormalityPoint,
    "coursePresentationPoint": coursePresentationPoint,
    "courseAveragePoint": courseAveragePoint,
  };
}
