import 'package:intl/intl.dart';

class VoucherModel {
  late final int id;
  final String? name;
  final String? code;
  final String? category;
  final String? description;
  final int? discount;
  final String? startDate;
  final String endDate;
  final int? minPurchase;
  final int? stock;

  VoucherModel({
    required this.id,
    this.name,
    this.code,
    this.category,
    this.description,
    this.discount,
    this.startDate,
    required this.endDate,
    this.minPurchase,
    this.stock,
  });

  String get formattedDate {
    final f = DateFormat('yyyy-MM-d');
    return f.format(DateTime.parse(endDate));
  }
}
