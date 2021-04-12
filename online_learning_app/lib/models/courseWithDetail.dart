// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

CourseWithDetail coursesFromJson(String str) => CourseWithDetail.fromJson(json.decode(str));

String coursesToJson(CourseWithDetail data) => json.encode(data.toJson());

class CourseWithDetail {
  CourseWithDetail({
    this.id,
    this.title,
    this.subtitle,
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
    this.isDeleted,
    this.isHidden,
    this.createdAt,
    this.updatedAt,
    this.instructorId,
    this.instructorName,
    this.section,
  });

  String id;
  String title;
  String subtitle;
  int price;
  String description;
  List<String> requirement;
  List<String> learnWhat;
  int soldNumber;
  int ratedNumber;
  int videoNumber;
  int totalHours;
  int formalityPoint;
  int contentPoint;
  int presentationPoint;
  String imageUrl;
  String promoVidUrl;
  String status;
  bool isDeleted;
  bool isHidden;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  String instructorName;
  List<Section> section;

  factory CourseWithDetail.fromJson(Map<String, dynamic> json) => CourseWithDetail(
    id: json["id"]== null ? 0 : json['soldNumber'].toInt(),
    title: json["title"],
    subtitle: json["subtitle"],
    price: json["price"]== null ? 0 : json['soldNumber'].toInt(),
    description: json["description"],
    requirement: List<String>.from(json["requirement"].map((x) => x)),
    learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
    soldNumber: json["soldNumber"]== null ? 0 : json['soldNumber'].toInt(),
    ratedNumber: json["ratedNumber"]== null ? 0 : json['soldNumber'].toInt(),
    videoNumber: json["videoNumber"]== null ? 0 : json['soldNumber'].toInt(),
    totalHours: json["totalHours"]== null ? 0 : json['soldNumber'].toInt(),
    formalityPoint: json["formalityPoint"]== null ? 0 : json['soldNumber'].toInt(),
    contentPoint: json["contentPoint"]== null ? 0 : json['soldNumber'].toInt(),
    presentationPoint: json["presentationPoint"]== null ? 0 : json['soldNumber'].toInt(),
    imageUrl: json["imageUrl"],
    promoVidUrl: json["promoVidUrl"],
    status: json["status"],
    isDeleted: json["isDeleted"],
    isHidden: json["isHidden"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    instructorId: json["instructorId"],
    instructorName: json["instructorName"],
    section: List<Section>.from(json["section"].map((x) => Section.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
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
    "isDeleted": isDeleted,
    "isHidden": isHidden,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "instructorId": instructorId,
    "instructorName": instructorName,
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
  });

  String id;
  String courseId;
  int numberOrder;
  String name;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  List<Lesson> lesson;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    courseId: json["courseId"],
    numberOrder: json["numberOrder"]== null ? 0 : json['soldNumber'].toInt(),
    name: json["name"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    lesson: List<Lesson>.from(json["lesson"].map((x) => Lesson.fromJson(x))),
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
  };
}

class Lesson {
  Lesson({
    this.id,
    this.courseId,
    this.sectionId,
    this.numberOrder,
    this.name,
    this.content,
    this.videoName,
    this.captionName,
    this.hours,
    this.isPreview,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.resource,
  });

  String id;
  String courseId;
  String sectionId;
  int numberOrder;
  String name;
  String content;
  String videoName;
  String captionName;
  int hours;
  bool isPreview;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  List<Resource> resource;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json["id"],
    courseId: json["courseId"],
    sectionId: json["sectionId"],
    numberOrder: json["numberOrder"]== null ? 0 : json['soldNumber'].toInt(),
    name: json["name"],
    content: json["content"],
    videoName: json["videoName"],
    captionName: json["captionName"],
    hours: json["hours"]== null ? 0 : json['soldNumber'].toInt(),
    isPreview: json["isPreview"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    resource: List<Resource>.from(json["resource"].map((x) => Resource.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courseId": courseId,
    "sectionId": sectionId,
    "numberOrder": numberOrder,
    "name": name,
    "content": content,
    "videoName": videoName,
    "captionName": captionName,
    "hours": hours,
    "isPreview": isPreview,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "resource": List<dynamic>.from(resource.map((x) => x.toJson())),
  };
}

class Resource {
  Resource({
    this.id,
    this.lessonId,
    this.name,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String lessonId;
  String name;
  String url;
  DateTime createdAt;
  DateTime updatedAt;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
    id: json["id"],
    lessonId: json["lessonId"],
    name: json["name"],
    url: json["url"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lessonId": lessonId,
    "name": name,
    "url": url,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}