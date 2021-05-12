// To parse this JSON data, do
//
//     final lessonDetail = lessonDetailFromJson(jsonString);

import 'dart:convert';

LessonDetail lessonDetailFromJson(String str) => LessonDetail.fromJson(json.decode(str));

String lessonDetailToJson(LessonDetail data) => json.encode(data.toJson());

class LessonDetail {
  LessonDetail({
    this.id,
    this.numberOrder,
    this.name,
    this.content,
    this.videoName,
    this.hours,
    this.sectionId,
    this.isFinish,
    this.nextLessonId,
    this.prevLessonId,
  });

  String id;
  int numberOrder;
  String name;
  String content;
  String videoName;
  double hours;
  String sectionId;
  bool isFinish;
  String nextLessonId;
  String prevLessonId;

  factory LessonDetail.fromJson(Map<String, dynamic> json) => LessonDetail(
    id: json["id"],
    numberOrder: json["numberOrder"],
    name: json["name"] == null ? 'no data' : json['name'] as String,
    content: json["content"] == null ? 'no data' : json['content'] as String,
    videoName: json["videoName"],
    hours: json["hours"] == null ? 0 : json["hours"].toDouble(),
    sectionId: json["sectionId"],
    isFinish: json["isFinish"] == null ? false : true,
    nextLessonId: json["nextLessonId"] == null ? 'null' : json['nextLessonId'] as String,
    prevLessonId: json["prevLessonId"] == null ? 'null' : json['prevLessonId'] as String,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "numberOrder": numberOrder,
    "name": name,
    "content": content,
    "videoName": videoName,
    "hours": hours,
    "sectionId": sectionId,
    "isFinish": isFinish,
    "nextLessonId": nextLessonId,
    "prevLessonId": prevLessonId,
  };
}
