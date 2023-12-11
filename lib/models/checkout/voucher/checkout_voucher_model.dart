// To parse this JSON data, do
//
//     final checkoutVoucher = checkoutVoucherFromMap(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

CheckoutVoucher checkoutVoucherFromMap(String str) => CheckoutVoucher.fromMap(json.decode(str));

String checkoutVoucherToMap(CheckoutVoucher data) => json.encode(data.toMap());

class CheckoutVoucher {
  int id;
  int userId;
  int voucherId;
  Voucher voucher;

  CheckoutVoucher({
    required this.id,
    required this.userId,
    required this.voucherId,
    required this.voucher,
  });

  factory CheckoutVoucher.fromMap(Map < String, dynamic > json) => CheckoutVoucher(
    id: json["id"],
    userId: json["user_id"],
    voucherId: json["voucher_id"],
    voucher: Voucher.fromMap(json["voucher"]),
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "user_id": userId,
    "voucher_id": voucherId,
    "voucher": voucher.toMap(),
  };
}

class Voucher {
  String name;
  String code;
  String category;
  String description;
  int discount;
  DateTime startDate;
  DateTime endDate;
  int minPurchase;
  String status;

  Voucher({
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

  String get formattedEndDate {
    final f = DateFormat('d MMM yy');
    return f.format(endDate);
  }

  String get formattedMinPurchase {
    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
    return f.format(minPurchase);
  }

  String get formattedDiscount {
    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
    return f.format(discount);
  }

  factory Voucher.fromMap(Map < String, dynamic > json) => Voucher(
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