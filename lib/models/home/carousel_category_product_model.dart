// To parse this JSON data, do
//
//     final carouselCategoryProduct = carouselCategoryProductFromMap(jsonString);

import 'dart:convert';

CarouselCategoryProduct carouselCategoryProductFromMap(String str) => CarouselCategoryProduct.fromMap(json.decode(str));

String carouselCategoryProductToMap(CarouselCategoryProduct data) => json.encode(data.toMap());

class CarouselCategoryProduct {
  List < Carousel > carousel;
  List < Category > category;
  List < Product > product;

  CarouselCategoryProduct({
    required this.carousel,
    required this.category,
    required this.product,
  });

  factory CarouselCategoryProduct.fromMap(Map < String, dynamic > json) => CarouselCategoryProduct(
    carousel: List < Carousel > .from(json["carousel"].map((x) => Carousel.fromMap(x))),
    category: List < Category > .from(json["category"].map((x) => Carousel.fromMap(x))),
    product: List < Product > .from(json["product"].map((x) => Product.fromMap(x))),
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
  int ? totalProduct;

  Carousel({
    required this.id,
    required this.name,
    required this.photo,
    this.totalProduct,
  });

  factory Carousel.fromMap(Map < String, dynamic > json) => Carousel(
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

class Category {
  int id;
  String name;
  String photo;
  int totalProduct;

  Category({
    required this.id,
    required this.name,
    required this.photo,
    required this.totalProduct,
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


class Product {
  int id;
  String name;
  double rating;
  int price;
  Photos photos;

  Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.price,
    required this.photos,
  });

  factory Product.fromMap(Map < String, dynamic > json) => Product(
    id: json["id"],
    name: json["name"],
    rating: json["rating"]?.toDouble(),
    price : json["price"],
    photos: Photos.fromMap(json["photos"]),
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
    "rating": rating,
    "price": price,
    "photos": photos.toMap(),
  };
}

class Photos {
  int id;
  int productId;
  String url;

  Photos({
    required this.id,
    required this.productId,
    required this.url,
  });

  factory Photos.fromMap(Map < String, dynamic > json) => Photos(
    id: json["id"],
    productId: json["product_id"],
    url: json["url"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "product_id": productId,
    "url": url,
  };
}