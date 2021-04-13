import 'dart:convert';

CourseOwningState courseOwningStateFromJson(String str) => CourseOwningState.fromJson(json.decode(str));

String courseOwningStateToJson(CourseOwningState data) => json.encode(data.toJson());

class CourseOwningState {
  CourseOwningState({
    this.message,
    this.isUserOwnCourse,
    this.isInstructorOwnCourse,
  });

  String message;
  bool isUserOwnCourse;
  bool isInstructorOwnCourse;

  factory CourseOwningState.fromJson(Map<String, dynamic> json) => CourseOwningState(
    message: json["message"],
    isUserOwnCourse: json["isUserOwnCourse"],
    isInstructorOwnCourse: json["isInstructorOwnCourse"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "isUserOwnCourse": isUserOwnCourse,
    "isInstructorOwnCourse": isInstructorOwnCourse,
  };
}