// To parse this JSON data, do
//
//     final createdGopayOrder = createdGopayOrderFromMap(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

CreatedGopayOrder createdGopayOrderFromMap(String str) => CreatedGopayOrder.fromMap(json.decode(str));

String createdGopayOrderToMap(CreatedGopayOrder data) => json.encode(data.toMap());

class CreatedGopayOrder {
  String transactionId;
  String orderId;
  String grossAmount;
  String paymentType;
  DateTime transactionTime;
  String transactionStatus;
  String fraudStatus;
  String maskedCard;
  String statusCode;
  String bank;
  String statusMessage;
  String approvalCode;
  String channelResponseCode;
  String channelResponseMessage;
  String currency;
  String cardType;
  String redirectUrl;
  String id;
  dynamic validationMessages;
  String installmentTerm;
  String eci;
  String savedTokenId;
  String savedTokenIdExpiredAt;
  int pointRedeemAmount;
  int pointRedeemQuantity;
  String pointBalanceAmount;
  String permataVaNumber;
  dynamic vaNumbers;
  String billKey;
  String billerCode;
  String acquirer;
  List < Action > actions;
  String paymentCode;
  String store;
  String qrString;
  bool onUs;
  String threeDsVersion;
  DateTime expiryTime;

  String get formattedTotalAmountPaid {
    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return f.format(double.parse(grossAmount));
  }

  String get formattedCreatedAt {
    final f = DateFormat('d-M-yyyy | HH.mm a');
    return f.format(transactionTime);
  }

  String get formattedPayUntil {
    final f = DateFormat('HH.mm a');
    return f.format(transactionTime.add(const Duration(hours: 1, minutes: 20)));
  }

  CreatedGopayOrder({
    required this.transactionId,
    required this.orderId,
    required this.grossAmount,
    required this.paymentType,
    required this.transactionTime,
    required this.transactionStatus,
    required this.fraudStatus,
    required this.maskedCard,
    required this.statusCode,
    required this.bank,
    required this.statusMessage,
    required this.approvalCode,
    required this.channelResponseCode,
    required this.channelResponseMessage,
    required this.currency,
    required this.cardType,
    required this.redirectUrl,
    required this.id,
    required this.validationMessages,
    required this.installmentTerm,
    required this.eci,
    required this.savedTokenId,
    required this.savedTokenIdExpiredAt,
    required this.pointRedeemAmount,
    required this.pointRedeemQuantity,
    required this.pointBalanceAmount,
    required this.permataVaNumber,
    required this.vaNumbers,
    required this.billKey,
    required this.billerCode,
    required this.acquirer,
    required this.actions,
    required this.paymentCode,
    required this.store,
    required this.qrString,
    required this.onUs,
    required this.threeDsVersion,
    required this.expiryTime,
  });

  factory CreatedGopayOrder.fromMap(Map < String, dynamic > json) => CreatedGopayOrder(
    transactionId: json["transaction_id"],
    orderId: json["order_id"],
    grossAmount: json["gross_amount"],
    paymentType: json["payment_type"],
    transactionTime: DateTime.parse(json["transaction_time"]),
    transactionStatus: json["transaction_status"],
    fraudStatus: json["fraud_status"],
    maskedCard: json["masked_card"],
    statusCode: json["status_code"],
    bank: json["bank"],
    statusMessage: json["status_message"],
    approvalCode: json["approval_code"],
    channelResponseCode: json["channel_response_code"],
    channelResponseMessage: json["channel_response_message"],
    currency: json["currency"],
    cardType: json["card_type"],
    redirectUrl: json["redirect_url"],
    id: json["id"],
    validationMessages: json["validation_messages"],
    installmentTerm: json["installment_term"],
    eci: json["eci"],
    savedTokenId: json["saved_token_id"],
    savedTokenIdExpiredAt: json["saved_token_id_expired_at"],
    pointRedeemAmount: json["point_redeem_amount"],
    pointRedeemQuantity: json["point_redeem_quantity"],
    pointBalanceAmount: json["point_balance_amount"],
    permataVaNumber: json["permata_va_number"],
    vaNumbers: json["va_numbers"],
    billKey: json["bill_key"],
    billerCode: json["biller_code"],
    acquirer: json["acquirer"],
    actions: List < Action > .from(json["actions"].map((x) => Action.fromMap(x))),
    paymentCode: json["payment_code"],
    store: json["store"],
    qrString: json["qr_string"],
    onUs: json["on_us"],
    threeDsVersion: json["three_ds_version"],
    expiryTime: DateTime.parse(json["expiry_time"]),
  );

  Map < String, dynamic > toMap() => {
    "transaction_id": transactionId,
    "order_id": orderId,
    "gross_amount": grossAmount,
    "payment_type": paymentType,
    "transaction_time": transactionTime.toIso8601String(),
    "transaction_status": transactionStatus,
    "fraud_status": fraudStatus,
    "masked_card": maskedCard,
    "status_code": statusCode,
    "bank": bank,
    "status_message": statusMessage,
    "approval_code": approvalCode,
    "channel_response_code": channelResponseCode,
    "channel_response_message": channelResponseMessage,
    "currency": currency,
    "card_type": cardType,
    "redirect_url": redirectUrl,
    "id": id,
    "validation_messages": validationMessages,
    "installment_term": installmentTerm,
    "eci": eci,
    "saved_token_id": savedTokenId,
    "saved_token_id_expired_at": savedTokenIdExpiredAt,
    "point_redeem_amount": pointRedeemAmount,
    "point_redeem_quantity": pointRedeemQuantity,
    "point_balance_amount": pointBalanceAmount,
    "permata_va_number": permataVaNumber,
    "va_numbers": vaNumbers,
    "bill_key": billKey,
    "biller_code": billerCode,
    "acquirer": acquirer,
    "actions": List < dynamic > .from(actions.map((x) => x.toMap())),
    "payment_code": paymentCode,
    "store": store,
    "qr_string": qrString,
    "on_us": onUs,
    "three_ds_version": threeDsVersion,
    "expiry_time": expiryTime.toIso8601String(),
  };
}

class Action {
  String name;
  String method;
  String url;
  dynamic fields;

  Action({
    required this.name,
    required this.method,
    required this.url,
    required this.fields,
  });

  factory Action.fromMap(Map < String, dynamic > json) => Action(
    name: json["name"],
    method: json["method"],
    url: json["url"],
    fields: json["fields"],
  );

  Map < String, dynamic > toMap() => {
    "name": name,
    "method": method,
    "url": url,
    "fields": fields,
  };
}