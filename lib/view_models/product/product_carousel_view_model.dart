import 'package:carousel_slider/carousel_slider.dart';
import 'package:disappear/models/product/product_model.dart';
import 'package:flutter/material.dart';

class ProductCarouselViewModel extends ChangeNotifier {
  final CarouselController carouselController = CarouselController();
  
  Product? _product;

  set product(Product? product) {
    _product = product;
  }

  Product? get product => _product;

  int? _currentIndex;

  set currentIndex(int? currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  int? get currentIndex => _currentIndex;
}