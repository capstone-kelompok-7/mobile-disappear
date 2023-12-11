import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/services/product_service.dart';
import 'package:flutter/material.dart';

class BestSellerProductViewModel extends ChangeNotifier {
  Future<List<Product>> getBestSellerProducts() async {
    final productService = ProductService();
    final products = await productService.getBestSellerProducts();

    return products;
  }
}