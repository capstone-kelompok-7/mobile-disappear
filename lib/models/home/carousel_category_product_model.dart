// To parse this JSON data, do
//
//     final carouselCategoryProduct = carouselCategoryProductFromMap(jsonString);

import 'dart:convert';

import 'package:disappear/models/home/best_seller_product_model.dart';

CarouselCategoryProduct carouselCategoryProductFromMap(String str) => CarouselCategoryProduct.fromMap(json.decode(str));

String carouselCategoryProductToMap(CarouselCategoryProduct data) => json.encode(data.toMap());

class CarouselCategoryProduct {
  List < Carousel > carousel;
  List < Category > category;
  List < BestSellerProduct > product;

  CarouselCategoryProduct({
    required this.carousel,
    required this.category,
    required this.product,
  });

  factory CarouselCategoryProduct.fromMap(Map < String, dynamic > json) => CarouselCategoryProduct(
    carousel: List < Carousel > .from(json["carousel"].map((x) => Carousel.fromMap(x))),
    category: List < Category > .from(json["category"].map((x) => Category.fromMap(x))),
    product: List < BestSellerProduct > .from(json["product"].map((x) => BestSellerProduct.fromMap(x))),
  );

  Map < String, dynamic > toMap() => {
    "carousel": List < dynamic > .from(carousel.map((x) => x.toMap())),
    "category": List < dynamic > .from(category.map((x) => x.toMap())),
    "product": List < dynamic > .from(product.map((x) => x.toMap())),
  };
}

class Carousel {
  int id;
  String name;
  String photo;

  Carousel({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory Carousel.fromMap(Map < String, dynamic > json) => Carousel(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
    "photo": photo,
  };
}

class Category {
  int id;
  String name;
  String photo;
  int ? totalProduct;

  Category({
    required this.id,
    required this.name,
    required this.photo,
    this.totalProduct,
  });

  factory Category.fromMap(Map < String, dynamic > json) => Category(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
    totalProduct: json["total_product"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
    "photo": photo,
    "total_product": totalProduct,
  };
}