// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
  Video({
    this.videoUrl,
    this.currentTime,
    this.isFinish,
  });

  String videoUrl;
  dynamic currentTime;
  dynamic isFinish;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    videoUrl: json["videoUrl"],
    currentTime: json["currentTime"] == null ? 'no data' : json["currentTime"] as String,
    isFinish: json["isFinish"] == null ? 'no data' : json["isFinish"] as String,
  );

  Map<String, dynamic> toJson() => {
    "videoUrl": videoUrl,
    "currentTime": currentTime,
    "isFinish": isFinish,
  };
}
