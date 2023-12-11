import 'package:dio/dio.dart';
import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/services/product_service.dart';
import 'package:flutter/material.dart';

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
      isSuccess = null;

      try {
        final productService = ProductService();
        await productService.addProductToCart(product!.id, quantity);

        isSuccess = true;
      } on DioException catch (e) {
        if (e.response != null) {
          if ([400, 403, 500].contains(e.response!.statusCode)) {
            // TODO
          }
        }

        isSuccess = false;
      } finally {
        isLoading = false;
      }
    }
  }
}