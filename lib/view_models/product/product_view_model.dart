import 'package:disappear/models/product_model.dart';
import 'package:disappear/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  int? _productId;

  set productId(int? productId) {
    _productId = productId;
    notifyListeners();
  }

  int? get productId => _productId;

  Future<ProductModel?> getProductById() async {
    if (productId != null) {
      final productService = ProductService();
      return await productService.getProductById(productId!);
    }

    return null;
  }
}