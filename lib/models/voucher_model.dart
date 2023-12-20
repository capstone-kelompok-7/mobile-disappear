// To parse this JSON data, do
//
//     final voucher = voucherFromMap(jsonString);

import 'dart:convert';

Voucher voucherFromMap(String str) => Voucher.fromMap(json.decode(str));

String voucherToMap(Voucher data) => json.encode(data.toMap());

class Voucher {
  int? id;
  String name;
  String code;
  String category;
  String description;
  int discount;
  DateTime startDate;
  DateTime endDate;
  int minPurchase;
  int? stock;

  Voucher({
    required this.id,
    required this.name,
    required this.code,
    required this.category,
    required this.description,
    required this.discount,
    required this.startDate,
    required this.endDate,
    required this.minPurchase,
    required this.stock,
  });

  factory Voucher.fromMap(Map < String, dynamic > json) => Voucher(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    category: json["category"],
    description: json["description"],
    discount: json["discount"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end-date"] ?? json["end_date"]),
    minPurchase: json["min_purchase"],
    stock: json["stock"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "name": name,
    "code": code,
    "category": category,
    "description": description,
    "discount": discount,
    "start_date": startDate.toIso8601String(),
    "end-date": endDate.toIso8601String(),
    "min_purchase": minPurchase,
    "stock": stock,
  };
}