// To parse this JSON data, do
//
//     final searchedCourse = searchedCourseFromJson(jsonString);

import 'dart:convert';

SearchedCourse searchedCourseFromJson(String str) => SearchedCourse.fromJson(json.decode(str));

String searchedCourseToJson(SearchedCourse data) => json.encode(data.toJson());

class SearchedCourse {
  SearchedCourse({
    this.title,
    this.id,
    this.price,
    this.description,
    this.learnWhat,
    this.soldNumber,
    this.ratedNumber,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.videoNumber,
    this.totalHours,
    this.imageUrl,
    this.updatedAt,
    this.name,
  });

  String title;
  String id;
  int price;
  String description;
  List<String> learnWhat;
  int soldNumber;
  int ratedNumber;
  int formalityPoint;
  int contentPoint;
  int presentationPoint;
  int videoNumber;
  double totalHours;
  String imageUrl;
  DateTime updatedAt;
  String name;

  factory SearchedCourse.fromJson(Map<String, dynamic> json) => SearchedCourse(
    title: json["title"] == null ? 'no data' : json["title"] as String,
    id: json["id"] == null ? 'no data ' : json["id"] as String,
    price: json["price"] == null ? 0 : json["price"].toInt(),
    description: json["description"] == null ? 'no data' : json["description"] as String,
    learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
    soldNumber: json["description"] == null ? 0 : json["soldNumber"].toInt(),
    ratedNumber: json["ratedNumber"] == null ? 0 : json["ratedNumber"].toInt(),
    formalityPoint: json["formalityPoint"] == null ? 0 : json["formalityPoint"].toInt(),
    contentPoint: json["contentPoint"] == null ? 0 : json["contentPoint"].toInt(),
    presentationPoint: json["presentationPoint"] == null ? 0  : json["presentationPoint"].toInt(),
    videoNumber: json["videoNumber"] == null ? 0 : json["videoNumber"].toInt(),
    totalHours: json["totalHours"] == null ? 0 : json["totalHours"].toDouble(),
    imageUrl: json["imageUrl"] == null ?  'no data' : json["imageUrl"] as String,
    updatedAt: DateTime.parse(json["updatedAt"]),
    name: json["name"] == null ?  'no data' : json["name"] as String,
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
    "price": price,
    "description": description,
    "learnWhat": List<dynamic>.from(learnWhat.map((x) => x)),
    "soldNumber": soldNumber,
    "ratedNumber": ratedNumber,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint,
    "presentationPoint": presentationPoint,
    "videoNumber": videoNumber,
    "totalHours": totalHours,
    "imageUrl": imageUrl,
    "updatedAt": updatedAt.toIso8601String(),
    "name": name,
  };
}
