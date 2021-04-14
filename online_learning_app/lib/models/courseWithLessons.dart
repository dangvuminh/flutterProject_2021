// To parse this JSON data, do
//
//     final courseWithLessons = courseWithLessonsFromJson(jsonString);

import 'dart:convert';

CourseWithLessons courseWithLessonsFromJson(String str) => CourseWithLessons.fromJson(json.decode(str));

String courseWithLessonsToJson(CourseWithLessons data) => json.encode(data.toJson());

class CourseWithLessons {
  CourseWithLessons({
    this.id,
    this.title,
    this.price,
    this.description,
    this.requirement,
    this.learnWhat,
    this.soldNumber,
    this.ratedNumber,
    this.videoNumber,
    this.totalHours,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.imageUrl,
    this.promoVidUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.instructorId,
    this.instructorName,
    this.userId,
    this.section,
  });

  String id;
  String title;
  int price;
  String description;
  List<String> requirement;
  List<String> learnWhat;
  int soldNumber;
  int ratedNumber;
  int videoNumber;
  double totalHours;
  int formalityPoint;
  int contentPoint;
  int presentationPoint;
  String imageUrl;
  String promoVidUrl;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  String instructorName;
  String userId;
  List<Section> section;

  factory CourseWithLessons.fromJson(Map<String, dynamic> json) => CourseWithLessons(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    requirement: List<String>.from(json["requirement"].map((x) => x)),
    learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
    soldNumber: json["soldNumber"],
    ratedNumber: json["ratedNumber"],
    videoNumber: json["videoNumber"],
    totalHours: json["totalHours"].toDouble(),
    formalityPoint: json["formalityPoint"],
    contentPoint: json["contentPoint"],
    presentationPoint: json["presentationPoint"],
    imageUrl: json["imageUrl"],
    promoVidUrl: json["promoVidUrl"] == null ? 'no data' : json["promoVidUrl"] as String,
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    instructorId: json["instructorId"],
    instructorName: json["instructorName"],
    userId: json["userId"],
    section: List<Section>.from(json["section"].map((x) => Section.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "requirement": List<dynamic>.from(requirement.map((x) => x)),
    "learnWhat": List<dynamic>.from(learnWhat.map((x) => x)),
    "soldNumber": soldNumber,
    "ratedNumber": ratedNumber,
    "videoNumber": videoNumber,
    "totalHours": totalHours,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint,
    "presentationPoint": presentationPoint,
    "imageUrl": imageUrl,
    "promoVidUrl": promoVidUrl,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "instructorId": instructorId,
    "instructorName": instructorName,
    "userId": userId,
    "section": List<dynamic>.from(section.map((x) => x.toJson())),
  };
}

class Section {
  Section({
    this.id,
    this.courseId,
    this.numberOrder,
    this.name,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.lesson,
    this.sumHours,
    this.sumLessonFinish,
  });

  String id;
  String courseId;
  int numberOrder;
  String name;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  List<Lesson> lesson;
  double sumHours;
  int sumLessonFinish;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    courseId: json["courseId"],
    numberOrder: json["numberOrder"],
    name: json["name"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    lesson: List<Lesson>.from(json["lesson"].map((x) => Lesson.fromJson(x))),
    sumHours: json["sumHours"].toDouble(),
    sumLessonFinish: json["sumLessonFinish"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courseId": courseId,
    "numberOrder": numberOrder,
    "name": name,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "lesson": List<dynamic>.from(lesson.map((x) => x.toJson())),
    "sumHours": sumHours,
    "sumLessonFinish": sumLessonFinish,
  };
}

class Lesson {
  Lesson({
    this.id,
    this.numberOrder,
    this.name,
    this.content,
    this.videoName,
    this.videoUrl,
    this.hours,
    this.sectionId,
    this.isFinish,
    this.resource,
  });

  String id;
  int numberOrder;
  String name;
  String content;
  String videoName;
  String videoUrl;
  double hours;
  String sectionId;
  bool isFinish;
  List<dynamic> resource;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json["id"],
    numberOrder: json["numberOrder"],
    name: json["name"],
    content: json["content"] == null ? 'no data' : json["promoVidUrl"] as String,
    videoName: json["videoName"] == null ? 'no data' : json["promoVidUrl"] as String,
    videoUrl: json["videoUrl"],
    hours: json["hours"].toDouble(),
    sectionId: json["sectionId"],
    isFinish: json["isFinish"] == null ? false : true,
    resource: List<dynamic>.from(json["resource"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "numberOrder": numberOrder,
    "name": name,
    "content": content,
    "videoName": videoName,
    "videoUrl": videoUrl,
    "hours": hours,
    "sectionId": sectionId,
    "isFinish": isFinish,
    "resource": List<dynamic>.from(resource.map((x) => x)),
  };
}
