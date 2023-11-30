import 'package:disappear/models/product_model.dart';
import 'package:disappear/services/product_service.dart';
import 'package:flutter/foundation.dart';

class SearchProductViewModel extends ChangeNotifier {
  bool _isOnSearch = false;

  set isOnSearch(bool isOnSearch) {
    _isOnSearch = isOnSearch;
    notifyListeners();
  }

  bool get isOnSearch => _isOnSearch;

  bool _isSearching = false;

  set isSearching(bool isSearching) {
    _isSearching = isSearching;
    notifyListeners();
  }

  bool get isSearching => _isSearching;

  List<ProductModel> _products = [];

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  List<ProductModel> get products => _products;

  Future<void> getProducts(String keyword) async {
    isOnSearch = true;
    isSearching = true;

    final productService = ProductService();
    products = await productService.getProductsByKeyword(keyword);

    isSearching = false;
  }
}