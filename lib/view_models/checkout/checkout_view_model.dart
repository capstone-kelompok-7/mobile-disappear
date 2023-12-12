import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:disappear/main.dart';
import 'package:disappear/models/cart/cart_model.dart';
import 'package:disappear/models/checkout/created_order_model.dart';
import 'package:disappear/models/checkout/voucher/checkout_voucher_model.dart';
import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/services/checkout_service.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutViewModel extends ChangeNotifier {
  String purchaseType = 'buy-now';

  Product? product;

  List<CartItem> _selectedItems = [];

  set selectedItems(List<CartItem> selectedItems) {
    _selectedItems = selectedItems;
    notifyListeners();
  }

  List<CartItem> get selectedItems => _selectedItems;

  TextEditingController notesController = TextEditingController();

  int fee = 2000;

  int get totalProductPrice {
    if (purchaseType == 'buy-now') {
      return product!.price!;
    }

    if (purchaseType == 'buy-by-cart') {
      int price = 0;

      for (CartItem item in selectedItems) {
        price += (item.price * item.quantity);
      }

      return price;
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

    if (purchaseType == 'buy-by-cart') {
      int discount = 0;

      for (CartItem item in selectedItems) {
        discount += (item.product.discount * item.quantity);
      }

      return discount;
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
        voucherId: voucherId,
        paymentMethod: paymentMethod
      );

      return createdOrder;
    } on DioException catch (e) {
      if ([403, 500].contains(e.response?.statusCode)) {
        await Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: error10,
          messageColor: whiteColor,
          borderColor: error30,
          borderWidth: 1,
          margin: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(5),
          message: e.response!.data['message'],
          duration: const Duration(seconds: 3),
        ).show(navigatorKey.currentContext!);
      }
      // TODO
    } finally {
      isCheckingOut = false;
    }

    return null;
  }

  Future<CreatedOrder?> createOrderByCart({
    required int addressId,
    required String paymentMethod,
    int? voucherId,
  }) async {
    isCheckingOut = true;

    try {
      final service = CheckoutService();
      final CreatedOrder createdOrder = await service.createOrderByCart(
        cartItems: selectedItems,
        addressId: addressId,
        note: notesController.text,
        voucherId: voucherId,
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