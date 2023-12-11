import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/models/product/product_review_model.dart';
import 'package:disappear/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductReviewViewModel extends ChangeNotifier {
  Product? product;

  int _page = 1;

  set page(int page) {
    _page = page;
  }

  int get page => _page;

  bool _isLoadingMore = false;

  set isLoadingMore(bool isLoadingMore) {
    _isLoadingMore = isLoadingMore;
    notifyListeners();
  }

  bool get isLoadingMore => _isLoadingMore;

  List<Review> _reviews = [];

  set reviews(List<Review> reviews) {
    _reviews = reviews;
    notifyListeners();
  }

  List<Review> get reviews => _reviews;

  Future<ProductReview?> getProductReviews() async {
    page = 1;

    final productService = ProductService();
    final productReview = await productService.getProductReviews(productId: product!.id);

    reviews = productReview!.reviews;

    return productReview;
  }

  Future<void> addProductReviews() async {
    isLoadingMore = true;

    page++;

    final productService = ProductService();
    final productReview = await productService.getProductReviews(productId: product!.id, page: page);

    reviews = [...reviews, ...productReview!.reviews];

    isLoadingMore = false;
  }
}