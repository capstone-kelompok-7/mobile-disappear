import 'package:dio/dio.dart';
import 'package:disappear/main.dart';
import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/services/product_service.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartViewModel extends ChangeNotifier {
  Product? _product;

  set product(Product? product) {
    _product = product;
  }

  Product? get product => _product;

  bool _isLoading = false;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  bool? _isSuccess;

  set isSuccess(bool? isSuccess) {
    _isSuccess = isSuccess;
    notifyListeners();
  }

  bool? get isSuccess => _isSuccess;

  int _quantity = 1;

  set quantity(int quantity) {
    if (quantity > 0) {
      _quantity = quantity;
      notifyListeners();
    }
  }

  int get quantity => _quantity;

  Future<void> addProductToCart() async {
    if (product != null) {
      isLoading = true;

      try {
        final productService = ProductService();
        await productService.addProductToCart(product!.id, quantity);

        addProductToCartSuccess();
      } on DioException catch (e) {
        if (e.response != null) {
          if ([400, 403, 500].contains(e.response!.statusCode)) {
            // TODO
          }
        }
      } finally {
        isLoading = false;
      }
    }
  }

  void addProductToCartSuccess() async {
    await Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: const Color(0xffE3FFF1),
      messageColor: neutral40,
      borderColor: const Color(0xff04C800),
      borderWidth: 1,
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(5),
      icon: SvgPicture.asset('assets/img/SuccessIcon.svg', width: 20, height: 20,),
      message: 'Produk telah ditambah ke keranjang',
      duration: const Duration(seconds: 3),
    ).show(navigatorKey.currentContext!);
  }
}