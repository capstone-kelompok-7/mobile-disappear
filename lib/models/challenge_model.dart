// To parse this JSON data, do
//
//     final challenge = challengeFromJson(jsonString);

import 'dart:convert';

Challenge challengeFromJson(String str) => Challenge.fromJson(json.decode(str));

String challengeToJson(Challenge data) => json.encode(data.toJson());

class Challenge {
    int id;
    String title;
    String photo;
    DateTime startDate;
    DateTime endDate;
    String description;
    String status;
    int exp;

    Challenge({
        required this.id,
        required this.title,
        required this.photo,
        required this.startDate,
        required this.endDate,
        required this.description,
        required this.status,
        required this.exp,
    });

    factory Challenge.fromJson(Map<String, dynamic> json) => Challenge(
        id: json["id"],
        title: json["title"],
        photo: json["photo"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        description: json["description"],
        status: json["status"],
        exp: json["exp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "photo": photo,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "description": description,
        "status": status,
        "exp": exp,
    };
}
