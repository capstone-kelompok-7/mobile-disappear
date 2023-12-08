class VoucherModel {
  final int? id;
  final String? name;
  final String? code;
  final String? category;
  final String? description;
  final int? discount;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? minPurchase;
  final int? stock;

  VoucherModel({
    this.id,
    this.name,
    this.code,
    this.category,
    this.description,
    this.discount,
    this.startDate,
    this.endDate,
    this.minPurchase,
    this.stock,
  });
}
