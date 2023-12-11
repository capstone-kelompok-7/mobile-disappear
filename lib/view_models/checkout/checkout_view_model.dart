import 'package:disappear/models/checkout/created_order_model.dart';
import 'package:disappear/models/checkout/voucher/checkout_voucher_model.dart';
import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/services/checkout_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutViewModel extends ChangeNotifier {
  String purchaseType = 'buy-now';

  Product? product;

  TextEditingController notesController = TextEditingController();

  int fee = 2000;

  int get totalProductPrice {
    if (purchaseType == 'buy-now') {
      return product!.price!;
    }

    return 0;
  }

  String get formattedTotalProductPrice {
    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return f.format(totalProductPrice);
  }

  int get totalProductDiscount {
    if (purchaseType == 'buy-now') {
      return product!.discount!;
    }

    return 0;
  }

  String get formattedTotalProductDiscount {
    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return f.format(totalProductDiscount);
  }

  String totalPrice({ required CheckoutVoucher? checkoutVoucher }) {
    int total = (totalProductPrice + fee);

    total -= totalProductDiscount;

    if (checkoutVoucher?.voucher != null) {
      total -= checkoutVoucher!.voucher.discount;
    }

    if (total < 0) total = 0;

    var f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return f.format(total);
  }

  bool _isCheckingOut = false;

  set isCheckingOut(bool isCheckingOut) {
    _isCheckingOut = isCheckingOut;
    notifyListeners();
  }

  bool get isCheckingOut => _isCheckingOut;

  Future<CreatedOrder?> createOrder({
    required int addressId,
    required String paymentMethod,
    int? voucherId,
  }) async {
    isCheckingOut = true;

    try {
      final service = CheckoutService();
      final CreatedOrder createdOrder = await service.createOrder(
        productId: product!.id,
        addressId: addressId,
        note: notesController.text,
        paymentMethod: paymentMethod
      );

      return createdOrder;
    } on Exception catch (e) {
      // TODO
    } finally {
      isCheckingOut = false;
    }

    return null;
  }
}