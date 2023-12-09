import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  Product? _product;

  set product(Product? product) {
    _product = product;
  }

  Product? get product => _product;

  Future<Product?> getProductById() async {
    if (product != null) {
      final productService = ProductService();
      return await productService.getProductById(product!.id);
    }

    return null;
  }

  Future<List<Product>> getOtherProducts() async {
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