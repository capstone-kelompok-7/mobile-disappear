import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselViewModel extends ChangeNotifier {
  final CarouselController carouselController = CarouselController();

  int _index = 0;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
}