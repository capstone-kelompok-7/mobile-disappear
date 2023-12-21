// To parse this JSON data, do
//
//     final article = articleFromMap(jsonString);

import 'dart:convert';

Article articleFromMap(String str) => Article.fromMap(json.decode(str));

String articleToMap(Article data) => json.encode(data.toMap());

class Article {
  int id;
  String title;
  String photo;
  String content;
  String author;
  DateTime date;
  int views;

  Article({
    required this.id,
    required this.title,
    required this.photo,
    required this.content,
    required this.author,
    required this.date,
    required this.views,
  });

  factory Article.fromMap(Map < String, dynamic > json) => Article(
    id: json["id"],
    title: json["title"],
    photo: json["photo"],
    content: json["content"],
    author: json["author"],
    date: DateTime.parse(json["date"]),
    views: json["views"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "title": title,
    "photo": photo,
    "content": content,
    "author": author,
    "date": date.toIso8601String(),
    "views": views,
  };
}