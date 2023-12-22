// To parse this JSON data, do
//
//     final leaderboard = leaderboardFromMap(jsonString);

import 'dart:convert';

Leaderboard leaderboardFromMap(String str) => Leaderboard.fromMap(json.decode(str));

String leaderboardToMap(Leaderboard data) => json.encode(data.toMap());

class Leaderboard {
  int id;
  String name;
  String photoProfile;
  int totalGram;
  int totalChallenge;
  String level;
  int exp;

  Leaderboard({
    required this.id,
    required this.name,
    required this.photoProfile,
    required this.totalGram,
    required this.totalChallenge,
    required this.level,
    required this.exp,
  });

  factory Leaderboard.fromMap(Map < String, dynamic > json) => Leaderboard(
    id: json["id"],
    name: json["name"],
    photoProfile: json["photo_profile"],
    totalGram: json["total_gram"],
    totalChallenge: json["total_challenge"],
    level: json["level"],
    exp: json["exp"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
    "photo_profile": photoProfile,
    "total_gram": totalGram,
    "total_challenge": totalChallenge,
    "level": level,
    "exp": exp,
  };
}