// To parse this JSON data, do
//
//     final checkoutAddress = checkoutAddressFromMap(jsonString);

import 'dart:convert';

CheckoutAddress checkoutAddressFromMap(String str) => CheckoutAddress.fromMap(json.decode(str));

String checkoutAddressToMap(CheckoutAddress data) => json.encode(data.toMap());

class CheckoutAddress {
  int id;
  int userId;
  String acceptedName;
  String phone;
  String address;
  bool isPrimary;

  CheckoutAddress({
    required this.id,
    required this.userId,
    required this.acceptedName,
    required this.phone,
    required this.address,
    required this.isPrimary,
  });

  factory CheckoutAddress.fromMap(Map < String, dynamic > json) => CheckoutAddress(
    id: json["id"],
    userId: json["user_id"],
    acceptedName: json["accepted_name"],
    phone: json["phone"],
    address: json["address"],
    isPrimary: json["is_primary"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "user_id": userId,
    "accepted_name": acceptedName,
    "phone": phone,
    "address": address,
    "is_primary": isPrimary,
  };
}