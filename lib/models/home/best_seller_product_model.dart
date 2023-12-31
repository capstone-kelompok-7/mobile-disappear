// To parse this JSON data, do
//
//     final bestSellerProduct = bestSellerProductFromMap(jsonString);

import 'dart:convert';

import 'package:disappear/models/product/product_model.dart';

BestSellerProduct bestSellerProductFromMap(String str) => BestSellerProduct.fromMap(json.decode(str));

String bestSellerProductToMap(BestSellerProduct data) => json.encode(data.toMap());

class BestSellerProduct {
  int id;
  String name;
  num rating;
  int price;
  Photos photos;

  BestSellerProduct({
    required this.id,
    required this.name,
    required this.rating,
    required this.price,
    required this.photos,
  });

  factory BestSellerProduct.fromMap(Map < String, dynamic > json) => BestSellerProduct(
    id: json["id"],
    name: json["name"],
    rating: json["rating"],
    price: json["price"],
    photos: Photos.fromMap(json["photos"]),
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
    "rating": rating,
    "price": price,
    "photos": photos.toMap(),
  };

  Product toProduct() => Product(
    id: id,
    name: name,
    price: price,
    rating: rating,
  );
}

class Photos {
  int id;
  String url;

  Photos({
    required this.id,
    required this.url,
  });

  factory Photos.fromMap(Map < String, dynamic > json) => Photos(
    id: json["id"],
    url: json["url"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "url": url,
  };
}