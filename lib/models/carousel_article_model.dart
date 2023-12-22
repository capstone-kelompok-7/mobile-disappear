// To parse this JSON data, do
//
//     final carouselArticleModel = carouselArticleModelFromJson(jsonString);

import 'dart:convert';

CarouselArticleModel carouselArticleModelFromJson(String str) =>
    CarouselArticleModel.fromJson(json.decode(str));

String carouselArticleModelToJson(CarouselArticleModel data) =>
    json.encode(data.toJson());

class CarouselArticleModel {
  int id;
  String title;
  String photo;
  String content;
  String author;
  DateTime date;
  int views;

  CarouselArticleModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.content,
    required this.author,
    required this.date,
    required this.views,
  });

  factory CarouselArticleModel.fromJson(Map<String, dynamic> json) =>
      CarouselArticleModel(
        id: json["id"],
        title: json["title"],
        photo: json["photo"],
        content: json["content"],
        author: json["author"],
        date: DateTime.parse(json["date"]),
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "photo": photo,
        "content": content,
        "author": author,
        "date": date.toIso8601String(),
        "views": views,
      };
}
