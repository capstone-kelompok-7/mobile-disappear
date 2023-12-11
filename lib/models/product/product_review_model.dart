// To parse this JSON data, do
//
//     final productReview = productReviewFromMap(jsonString);

import 'dart:convert';

import 'package:disappear/models/product/product_model.dart';

ProductReview productReviewFromMap(String str) => ProductReview.fromMap(json.decode(str));

String productReviewToMap(ProductReview data) => json.encode(data.toMap());

class ProductReview {
  int id;
  String name;
  int currentRatingFive;
  int currentRatingFour;
  int currentRatingThree;
  int currentRatingTwo;
  int currentRatingOne;
  double rating;
  int totalReview;
  List < Review > reviews;

  ProductReview({
    required this.id,
    required this.name,
    required this.currentRatingFive,
    required this.currentRatingFour,
    required this.currentRatingThree,
    required this.currentRatingTwo,
    required this.currentRatingOne,
    required this.rating,
    required this.totalReview,
    required this.reviews,
  });

  factory ProductReview.fromMap(Map < String, dynamic > json) => ProductReview(
    id: json["id"],
    name: json["name"],
    currentRatingFive: json["current_rating_five"],
    currentRatingFour: json["current_rating_four"],
    currentRatingThree: json["current_rating_three"],
    currentRatingTwo: json["current_rating_two"],
    currentRatingOne: json["current_rating_one"],
    rating: json["rating"]?.toDouble(),
    totalReview : json["total_review"],
    reviews: json["reviews"] != null ? List < Review > .from(json["reviews"].map((x) => Review.fromMap(x))) : [],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
    "current_rating_five": currentRatingFive,
    "current_rating_four": currentRatingFour,
    "current_rating_three": currentRatingThree,
    "current_rating_two": currentRatingTwo,
    "current_rating_one": currentRatingOne,
    "rating": rating,
    "total_review": totalReview,
    "reviews": reviews != null ? List < dynamic > .from(reviews!.map((x) => x.toMap())) : [],
  };
}