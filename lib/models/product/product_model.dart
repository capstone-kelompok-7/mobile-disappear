// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  int id;
  String? name;
  String? description;
  int? gramPlastic;
  int? stock;
  int? discount;
  int? exp;
  int? price;
  num? rating;
  int? totalReview;
  int? totalSold;
  List < Category >? categories;
  List < ImageUrl >? imageUrl;
  List < Review >? reviews;

  ImageUrl? get thumbnail {
    if (imageUrl == null) {
      return null;
    }

    if (imageUrl!.isEmpty) {
      return null;
    }

    return imageUrl!.first;
  }

  Product({
    required this.id,
    this.name,
    this.description,
    this.gramPlastic,
    this.stock,
    this.discount,
    this.exp,
    this.price,
    this.rating,
    this.totalReview,
    this.totalSold,
    this.categories,
    this.imageUrl,
    this.reviews,
  });

  factory Product.fromMap(Map < String, dynamic > json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    gramPlastic: json["gram_plastic"],
    stock: json["stock"],
    discount: json["discount"],
    exp: json["exp"],
    price: json["price"],
    rating: json["rating"]?.toDouble(),
    totalReview : json["total_review"],
    totalSold: json["total_sold"],
    categories: json["categories"] != null ? List < Category > .from(json["categories"].map((x) => Category.fromMap(x))) : [],
    imageUrl: json["image_url"] != null ? List < ImageUrl > .from(json["image_url"].map((x) => ImageUrl.fromMap(x))) : [],
    reviews: json["reviews"] != null ? List < Review > .from(json["reviews"].map((x) => Review.fromMap(x))) : [],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "gram_plastic": gramPlastic,
    "stock": stock,
    "discount": discount,
    "exp": exp,
    "price": price,
    "rating": rating,
    "total_review": totalReview,
    "total_sold": totalSold,
    "categories": categories != null ? List < dynamic > .from(categories!.map((x) => x.toMap())) : [],
    "image_url": imageUrl != null ? List < dynamic > .from(imageUrl!.map((x) => x.toMap())) : [],
    "reviews": reviews != null ? List < dynamic > .from(reviews!.map((x) => x.toMap())) : [],
  };
}

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromMap(Map < String, dynamic > json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
  };
}

class ImageUrl {
  int id;
  String imageUrl;

  ImageUrl({
    required this.id,
    required this.imageUrl,
  });

  factory ImageUrl.fromMap(Map < String, dynamic > json) => ImageUrl(
    id: json["id"],
    imageUrl: json["image_url"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "image_url": imageUrl,
  };
}

class Review {
  int id;
  int userId;
  String name;
  String photoProfile;
  int rating;
  String description;
  DateTime date;
  List < Photo >? photo;

  Review({
    required this.id,
    required this.userId,
    required this.name,
    required this.photoProfile,
    required this.rating,
    required this.description,
    required this.date,
    required this.photo,
  });

  factory Review.fromMap(Map < String, dynamic > json) => Review(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    photoProfile: json["photo_profile"],
    rating: json["rating"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    photo: json["photo"] != null ? List < Photo > .from(json["photo"].map((x) => Photo.fromMap(x))) : [],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "photo_profile": photoProfile,
    "rating": rating,
    "description": description,
    "date": date.toIso8601String(),
    "photo": photo != null ? List < dynamic > .from(photo!.map((x) => x.toMap())) : [],
  };
}

class Photo {
  int id;
  String photo;

  Photo({
    required this.id,
    required this.photo,
  });

  factory Photo.fromMap(Map < String, dynamic > json) => Photo(
    id: json["id"],
    photo: json["photo"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "photo": photo,
  };
}