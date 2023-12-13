// To parse this JSON data, do
//
//     final challengeArticle = challengeArticleFromMap(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:timeago/timeago.dart' as timeago;

ChallengeArticle challengeArticleFromMap(String str) => ChallengeArticle.fromMap(json.decode(str));

String challengeArticleToMap(ChallengeArticle data) => json.encode(data.toMap());

class ChallengeArticle {
  List < Challenge > challenge;
  List < Article > articles;

  ChallengeArticle({
    required this.challenge,
    required this.articles,
  });

  factory ChallengeArticle.fromMap(Map < String, dynamic > json) => ChallengeArticle(
    challenge: List < Challenge > .from(json["challenge"].map((x) => Challenge.fromMap(x))),
    articles: List < Article > .from(json["articles"].map((x) => Article.fromMap(x))),
  );

  Map < String, dynamic > toMap() => {
    "challenge": List < dynamic > .from(challenge.map((x) => x.toMap())),
    "articles": List < dynamic > .from(articles.map((x) => x.toMap())),
  };
}

class Article {
  int id;
  String title;
  String photo;
  String content;
  String authors;
  int views;
  DateTime createdAt;

  Article({
    required this.id,
    required this.title,
    required this.photo,
    required this.content,
    required this.authors,
    required this.views,
    required this.createdAt,
  });

  String get createdAgo {
    return timeago.format(createdAt, locale: 'id');
  }

  String get formattedDate {
    final f = DateFormat('d MMMM yyyy');
    return f.format(createdAt);
  }

  factory Article.fromMap(Map < String, dynamic > json) => Article(
    id: json["id"],
    title: json["title"],
    photo: json["photo"],
    content: json["content"],
    authors: json["authors"],
    views: json["views"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "title": title,
    "photo": photo,
    "content": content,
    "authors": authors,
    "views": views,
    "created_at": createdAt.toIso8601String(),
  };
}

class Challenge {
  int id;
  String title;
  String photo;
  int exp;

  Challenge({
    required this.id,
    required this.title,
    required this.photo,
    required this.exp,
  });

  factory Challenge.fromMap(Map < String, dynamic > json) => Challenge(
    id: json["id"],
    title: json["title"],
    photo: json["photo"],
    exp: json["exp"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "title": title,
    "photo": photo,
    "exp": exp,
  };
}