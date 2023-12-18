// To parse this JSON data, do
//
//     final cart = cartFromMap(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

Cart cartFromMap(String str) => Cart.fromMap(json.decode(str));

String cartToMap(Cart data) => json.encode(data.toMap());

class Cart {
  int id;
  int userId;
  int grantTotal;
  List < CartItem > cartItems;

  Cart({
    required this.id,
    required this.userId,
    required this.grantTotal,
    required this.cartItems,
  });

  factory Cart.fromMap(Map < String, dynamic > json) => Cart(
    id: json["id"],
    userId: json["user_id"],
    grantTotal: json["grant_total"],
    cartItems: List < CartItem > .from(json["cart_items"].map((x) => CartItem.fromMap(x))),
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "user_id": userId,
    "grant_total": grantTotal,
    "cart_items": List < dynamic > .from(cartItems.map((x) => x.toMap())),
  };
}

class CartItem {
  int cartItemId;
  String productName;
  int gramPlastic;
  int price;
  int quantity;
  int totalPrice;
  CartProduct product;

  String get formattedPrice {
    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return f.format(price);
  }

  CartItem({
    required this.cartItemId,
    required this.productName,
    required this.gramPlastic,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.product,
  });

  factory CartItem.fromMap(Map < String, dynamic > json) => CartItem(
    cartItemId: json["cart_item_id"],
    productName: json["product_name"],
    gramPlastic: json["gram_plastic"],
    price: json["price"],
    quantity: json["quantity"],
    totalPrice: json["total_price"],
    product: CartProduct.fromMap(json["product"]),
  );

  Map < String, dynamic > toMap() => {
    "cart_item_id": cartItemId,
    "product_name": productName,
    "gram_plastic": gramPlastic,
    "price": price,
    "quantity": quantity,
    "total_price": totalPrice,
    "product": product.toMap(),
  };
}

class CartProduct {
  int id;
  String name;
  int price;
  int discount;
  List < CartProductPhoto > productPhotos;

  CartProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.productPhotos,
  });

  factory CartProduct.fromMap(Map < String, dynamic > json) => CartProduct(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    discount: json["discount"],
    productPhotos: List < CartProductPhoto > .from((json["product_photos"] ?? []).map((x) => CartProductPhoto.fromMap(x))),
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
    "price": price,
    "product_photos": List < dynamic > .from((productPhotos).map((x) => x.toMap())),
  };
}

class CartProductPhoto {
  int id;
  int productId;
  String url;

  CartProductPhoto({
    required this.id,
    required this.productId,
    required this.url,
  });

  factory CartProductPhoto.fromMap(Map < String, dynamic > json) => CartProductPhoto(
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