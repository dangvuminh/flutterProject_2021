// To parse this JSON data, do
//
//     final ownCourse = ownCourseFromJson(jsonString);

import 'dart:convert';

OwnCourse ownCourseFromJson(String str) => OwnCourse.fromJson(json.decode(str));

String ownCourseToJson(OwnCourse data) => json.encode(data.toJson());

class OwnCourse {
  OwnCourse({
    this.id,
    this.courseTitle,
    this.courseImage,
    this.instructorId,
    this.instructorName,
    this.latestLearnTime,
    this.total,
    this.learnLesson,
    this.process,
  });

  String id;
  String courseTitle;
  String courseImage;
  String instructorId;
  String instructorName;
  DateTime latestLearnTime;
  int total;
  int learnLesson;
  int process;

  factory OwnCourse.fromJson(Map<String, dynamic> json) => OwnCourse(
    id: json["id"],
    courseTitle: json["courseTitle"],
    courseImage: json["courseImage"],
    instructorId: json["instructorId"],
    instructorName: json["instructorName"],
    latestLearnTime: DateTime.parse(json["latestLearnTime"]),
    total: json["total"].toInt(),
    learnLesson: json["learnLesson"],
    process: json["process"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courseTitle": courseTitle,
    "courseImage": courseImage,
    "instructorId": instructorId,
    "instructorName": instructorName,
    "latestLearnTime": latestLearnTime.toIso8601String(),
    "total": total,
    "learnLesson": learnLesson,
    "process": process,
  };
}
