// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    this.message,
    this.freeCourseLink,
  });

  String message;
  String freeCourseLink;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    message: json["message"],
    freeCourseLink: json["freeCourseLink"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "freeCourseLink": freeCourseLink,
  };
}
