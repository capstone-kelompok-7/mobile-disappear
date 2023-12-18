// To parse this JSON data, do
//
//     final orderDetailByIdModel = orderDetailByIdModelFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';

OrderDetailByIdModel orderDetailByIdModelFromJson(String str) =>
    OrderDetailByIdModel.fromJson(json.decode(str));

String orderDetailByIdModelToJson(OrderDetailByIdModel data) =>
    json.encode(data.toJson());

class OrderDetailByIdModel {
  String id;
  String idOrder;
  int addressId;
  int userId;
  int voucherId;
  String note;
  int grandTotalGramPlastic;
  int grandTotalExp;
  int grandTotalQuantity;
  int grandTotalPrice;
  int shipmentFee;
  int adminFees;
  int grandTotalDiscount;
  int totalAmountPaid;
  String orderStatus;
  String paymentStatus;
  String paymentMethod;
  String extraInfo;
  DateTime statusOrderDate;
  DateTime createdAt;
  Address address;
  User user;
  Voucher voucher;
  List<OrderDetail> orderDetails;

  OrderDetailByIdModel({
    required this.id,
    required this.idOrder,
    required this.addressId,
    required this.userId,
    required this.voucherId,
    required this.note,
    required this.grandTotalGramPlastic,
    required this.grandTotalExp,
    required this.grandTotalQuantity,
    required this.grandTotalPrice,
    required this.shipmentFee,
    required this.adminFees,
    required this.grandTotalDiscount,
    required this.totalAmountPaid,
    required this.orderStatus,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.extraInfo,
    required this.statusOrderDate,
    required this.createdAt,
    required this.address,
    required this.user,
    required this.voucher,
    required this.orderDetails,
  });

  factory OrderDetailByIdModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailByIdModel(
        id: json["id"],
        idOrder: json["id_order"],
        addressId: json["address_id"],
        userId: json["user_id"],
        voucherId: json["voucher_id"],
        note: json["note"],
        grandTotalGramPlastic: json["grand_total_gram_plastic"],
        grandTotalExp: json["grand_total_exp"],
        grandTotalQuantity: json["grand_total_quantity"],
        grandTotalPrice: json["grand_total_price"],
        shipmentFee: json["shipment_fee"],
        adminFees: json["admin_fees"],
        grandTotalDiscount: json["grand_total_discount"],
        totalAmountPaid: json["total_amount_paid"],
        orderStatus: json["order_status"],
        paymentStatus: json["payment_status"],
        paymentMethod: json["payment_method"],
        extraInfo: json["extra_info"],
        statusOrderDate: DateTime.parse(json["status_order_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        address: Address.fromJson(json["address"]),
        user: User.fromJson(json["user"]),
        voucher: Voucher.fromJson(json["voucher"]),
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_order": idOrder,
        "address_id": addressId,
        "user_id": userId,
        "voucher_id": voucherId,
        "note": note,
        "grand_total_gram_plastic": grandTotalGramPlastic,
        "grand_total_exp": grandTotalExp,
        "grand_total_quantity": grandTotalQuantity,
        "grand_total_price": grandTotalPrice,
        "shipment_fee": shipmentFee,
        "admin_fees": adminFees,
        "grand_total_discount": grandTotalDiscount,
        "total_amount_paid": totalAmountPaid,
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "payment_method": paymentMethod,
        "extra_info": extraInfo,
        "status_order_date": statusOrderDate.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "address": address.toJson(),
        "user": user.toJson(),
        "voucher": voucher.toJson(),
        "order_details":
            List<dynamic>.from(orderDetails.map((x) => x.toJson())),
      };

  String get formattedDate {
    final f = DateFormat('dd-MM-yyyy');
    return f.format(createdAt);
  }
}

class Address {
  int id;
  int userId;
  String acceptedName;
  String phone;
  String address;
  bool isPrimary;

  Address({
    required this.id,
    required this.userId,
    required this.acceptedName,
    required this.phone,
    required this.address,
    required this.isPrimary,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        acceptedName: json["accepted_name"],
        phone: json["phone"],
        address: json["address"],
        isPrimary: json["is_primary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "accepted_name": acceptedName,
        "phone": phone,
        "address": address,
        "is_primary": isPrimary,
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
  List<ProductPhoto> productPhotos;

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
            (json["product_photos"] ?? []).map((x) => ProductPhoto.fromJson(x))),
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

class User {
  int id;
  String email;
  String phone;
  String name;
  String photoProfile;

  User({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.photoProfile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        name: json["name"],
        photoProfile: json["photo_profile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "name": name,
        "photo_profile": photoProfile,
      };
}

class Voucher {
  int id;
  String name;
  String code;
  String category;
  String description;
  int discount;
  int minPurchase;

  Voucher({
    required this.id,
    required this.name,
    required this.code,
    required this.category,
    required this.description,
    required this.discount,
    required this.minPurchase,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        category: json["category"],
        description: json["description"],
        discount: json["discount"],
        minPurchase: json["min_purchase"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "category": category,
        "description": description,
        "discount": discount,
        "min_purchase": minPurchase,
      };
}
