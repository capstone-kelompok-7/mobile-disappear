// To parse this JSON data, do
//
//     final voucher = voucherFromMap(jsonString);

import 'dart:convert';

Voucher voucherFromMap(String str) => Voucher.fromMap(json.decode(str));

String voucherToMap(Voucher data) => json.encode(data.toMap());

class Voucher {
  int id;
  int userId;
  int voucherId;
  VoucherClass voucher;

  Voucher({
    required this.id,
    required this.userId,
    required this.voucherId,
    required this.voucher,
  });

  factory Voucher.fromMap(Map < String, dynamic > json) => Voucher(
    id: json["id"],
    userId: json["user_id"],
    voucherId: json["voucher_id"],
    voucher: VoucherClass.fromMap(json["voucher"]),
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "user_id": userId,
    "voucher_id": voucherId,
    "voucher": voucher.toMap(),
  };
}

class VoucherClass {
  String name;
  String code;
  String category;
  String description;
  int discount;
  DateTime startDate;
  DateTime endDate;
  int minPurchase;
  String status;

  VoucherClass({
    required this.name,
    required this.code,
    required this.category,
    required this.description,
    required this.discount,
    required this.startDate,
    required this.endDate,
    required this.minPurchase,
    required this.status,
  });

  factory VoucherClass.fromMap(Map < String, dynamic > json) => VoucherClass(
    name: json["name"],
    code: json["code"],
    category: json["category"],
    description: json["description"],
    discount: json["discount"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    minPurchase: json["min_purchase"],
    status: json["status"],
  );

  Map < String, dynamic > toMap() => {
    "name": name,
    "code": code,
    "category": category,
    "description": description,
    "discount": discount,
    "start_date": startDate.toIso8601String(),
    "end_date": endDate.toIso8601String(),
    "min_purchase": minPurchase,
    "status": status,
  };
}