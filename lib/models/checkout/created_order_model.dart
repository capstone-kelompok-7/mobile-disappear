// To parse this JSON data, do
//
//     final createdOrder = createdOrderFromMap(jsonString);

import 'dart:convert';

CreatedOrder createdOrderFromMap(String str) => CreatedOrder.fromMap(json.decode(str));

String createdOrderToMap(CreatedOrder data) => json.encode(data.toMap());

class CreatedOrder {
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
  DateTime createdAt;
  List < OrderDetail > orderDetails;

  CreatedOrder({
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
    required this.createdAt,
    required this.orderDetails,
  });

  factory CreatedOrder.fromMap(Map < String, dynamic > json) => CreatedOrder(
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
    createdAt: DateTime.parse(json["created_at"]),
    orderDetails: List < OrderDetail > .from(json["order_details"].map((x) => OrderDetail.fromMap(x))),
  );

  Map < String, dynamic > toMap() => {
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
    "created_at": createdAt.toIso8601String(),
    "order_details": List < dynamic > .from(orderDetails.map((x) => x.toMap())),
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

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.totalGramPlastic,
    required this.totalExp,
    required this.totalPrice,
    required this.totalDiscount,
  });

  factory OrderDetail.fromMap(Map < String, dynamic > json) => OrderDetail(
    id: json["id"],
    orderId: json["order_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    totalGramPlastic: json["total_gram_plastic"],
    totalExp: json["total_exp"],
    totalPrice: json["total_price"],
    totalDiscount: json["total_discount"],
  );

  Map < String, dynamic > toMap() => {
    "id": id,
    "order_id": orderId,
    "product_id": productId,
    "quantity": quantity,
    "total_gram_plastic": totalGramPlastic,
    "total_exp": totalExp,
    "total_price": totalPrice,
    "total_discount": totalDiscount,
  };
}