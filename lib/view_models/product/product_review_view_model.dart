import 'package:disappear/models/product_model.dart';
import 'package:disappear/models/review_model.dart';
import 'package:disappear/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductReviewViewModel extends ChangeNotifier {
  ProductModel? product;

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

  List<ProductReviewItemModel> _reviews = [];

  set reviews(List<ProductReviewItemModel> reviews) {
    _reviews = reviews;
    notifyListeners();
  }

  List<ProductReviewItemModel> get reviews => _reviews;

  Future<ProductReviewModel?> getProductReviews() async {
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