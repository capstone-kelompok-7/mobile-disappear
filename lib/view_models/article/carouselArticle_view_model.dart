import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselArticleViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  int get currentIndex => _currentIndex;
  CarouselController get carouselController => _carouselController;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void onPageChanged(int index) {
    currentIndex = index;
  }

  void animateToPage(int page) {
    _carouselController.animateToPage(page);
  }
}
