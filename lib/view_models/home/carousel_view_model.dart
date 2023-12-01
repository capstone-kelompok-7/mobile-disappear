import 'package:carousel_slider/carousel_slider.dart';
import 'package:disappear/models/carousel_model.dart';
import 'package:disappear/services/carousel_service.dart';
import 'package:flutter/material.dart';

class CarouselViewModel extends ChangeNotifier {
  final CarouselController carouselController = CarouselController();
  
  Future<List<CarouselModel>> getCarousel() async {
    final categoryService = CarouselService();
    return await categoryService.getCarousel();
  }

  int _index = 0;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
}