// To parse this JSON data, do
//
//     final orderAllUserModel = orderAllUserModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

OrderAllUserModel orderAllUserModelFromJson(String str) =>
    OrderAllUserModel.fromJson(json.decode(str));

String orderAllUserModelToJson(OrderAllUserModel data) =>
    json.encode(data.toJson());

class OrderAllUserModel {
  String? id;
  String? idOrder;
  int? userId;
  String? note;
  int? totalAmountPaid;
  String? orderStatus;
  String? paymentStatus;
  String? paymentMethod;
  String? extraInfo;
  DateTime? statusOrderDate;
  DateTime? createdAt;
  List<OrderDetail>? orderDetails = [];

  OrderAllUserModel({
    this.id,
    this.idOrder,
    this.userId,
    this.note,
    this.totalAmountPaid,
    this.orderStatus,
    this.paymentStatus,
    this.paymentMethod,
    this.extraInfo,
    this.statusOrderDate,
    this.createdAt,
    this.orderDetails,
  });

  factory OrderAllUserModel.fromJson(Map<String, dynamic> json) =>
      OrderAllUserModel(
        id: json["id"],
        idOrder: json["id_order"],
        userId: json["user_id"],
        note: json["note"],
        totalAmountPaid: json["total_amount_paid"],
        orderStatus: json["order_status"],
        paymentStatus: json["payment_status"],
        paymentMethod: json["payment_method"],
        extraInfo: json["extra_info"],
        statusOrderDate: DateTime.parse(json["status_order_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_order": idOrder,
        "user_id": userId,
        "note": note,
        "total_amount_paid": totalAmountPaid,
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "payment_method": paymentMethod,
        "extra_info": extraInfo,
        "status_order_date": statusOrderDate!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "order_details":
            List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
      };
}

class OrderDetail {
  int id;
  String orderId;
  int productId;
  int quantity;
  int totalGramPlastic;
  int totalExp;
  int totalPrice;
  int totalDiscount;
  Product product;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.totalGramPlastic,
    required this.totalExp,
    required this.totalPrice,
    required this.totalDiscount,
    required this.product,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        totalGramPlastic: json["total_gram_plastic"],
        totalExp: json["total_exp"],
        totalPrice: json["total_price"],
        totalDiscount: json["total_discount"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "total_gram_plastic": totalGramPlastic,
        "total_exp": totalExp,
        "total_price": totalPrice,
        "total_discount": totalDiscount,
        "product": product.toJson(),
      };
}

class Product {
  int id;
  String name;
  int price;
  int discount;
  int gramPlastic;
  int productExp;
  List<ProductPhoto> productPhotos = [];

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.gramPlastic,
    required this.productExp,
    required this.productPhotos,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        discount: json["discount"],
        gramPlastic: json["gram_plastic"],
        productExp: json["product_exp"],
        productPhotos: List<ProductPhoto>.from(
            json["product_photos"].map((x) => ProductPhoto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "discount": discount,
        "gram_plastic": gramPlastic,
        "product_exp": productExp,
        "product_photos":
            List<dynamic>.from(productPhotos.map((x) => x.toJson())),
      };
}

class ProductPhoto {
  int id;
  int productId;
  String url;

  ProductPhoto({
    required this.id,
    required this.productId,
    required this.url,
  });

  factory ProductPhoto.fromJson(Map<String, dynamic> json) => ProductPhoto(
        id: json["id"],
        productId: json["product_id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "url": url,
      };
}
