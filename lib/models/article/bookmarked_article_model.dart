// To parse this JSON data, do
//
//     final bookmarkedArticle = bookmarkedArticleFromMap(jsonString);

import 'dart:convert';

BookmarkedArticle bookmarkedArticleFromMap(String str) => BookmarkedArticle.fromMap(json.decode(str));

String bookmarkedArticleToMap(BookmarkedArticle data) => json.encode(data.toMap());

class BookmarkedArticle {
  int id;
  int userId;
  int articleId;
  Article article;

  BookmarkedArticle({
    required this.id,
    required this.userId,
    required this.articleId,
    required this.article,
  });

  factory BookmarkedArticle.fromMap(Map < String, dynamic > json) => BookmarkedArticle(
    id: json["id"],
    userId: json["user_id"],
    articleId: json["article_id"],
    article: Article.fromMap(json["article"]),
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "user_id": userId,
    "article_id": articleId,
    "article": article.toMap(),
  };
}

class Article {
  String title;
  String photo;
  String content;
  String author;
  DateTime date;
  int views;

  Article({
    required this.title,
    required this.photo,
    required this.content,
    required this.author,
    required this.date,
    required this.views,
  });

  factory Article.fromMap(Map < String, dynamic > json) => Article(
    title: json["title"],
    photo: json["photo"],
    content: json["content"],
    author: json["author"],
    date: DateTime.parse(json["date"]),
    views: json["views"],
  );

  Map < String, dynamic > toMap() => {
    "title": title,
    "photo": photo,
    "content": content,
    "author": author,
    "date": date.toIso8601String(),
    "views": views,
  };
}