import 'package:disappear/models/product_model.dart';
import 'package:disappear/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  int? _productId;

  set productId(int? productId) {
    _productId = productId;
  }

  int? get productId => _productId;

  Future<ProductModel?> getProductById() async {
    if (productId != null) {
      final productService = ProductService();
      return await productService.getProductById(productId!);
    }

    return null;
  }

  Future<List<ProductModel>> getOtherProducts() async {
    final productService = ProductService();
    return await productService.getOtherProducts();
  }

  bool _isExpanded = false;

  set isExpanded(bool isExpanded) {
    _isExpanded = isExpanded;
    notifyListeners();
  }

  bool get isExpanded => _isExpanded;
}