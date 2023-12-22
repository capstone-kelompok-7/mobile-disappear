// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  int id;
  int userId;
  String title;
  String body;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "body": body,
      };
}
