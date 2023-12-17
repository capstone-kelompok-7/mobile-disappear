import 'package:carousel_slider/carousel_controller.dart';
import 'package:disappear/models/carousel_article_model.dart';
import 'package:disappear/services/carousel_article_service.dart';
import 'package:flutter/material.dart';

class CarouselArticleViewModel extends ChangeNotifier {
  final CarouselArticleService _carouselArticleService =
      CarouselArticleService();
  late List<CarouselArticleModel> _carouselArticles = [];

  List<CarouselArticleModel> get carouselArticles => _carouselArticles;

  Future<List<CarouselArticleModel>> getCarouselArticles() async {
    try {
      _carouselArticles = await _carouselArticleService.getCarouselArticle();
      notifyListeners();
      return _carouselArticles;
    } catch (error) {
      debugPrint('Error fetching carousel articles: $error');
      rethrow;
    }
  }

  final CarouselController carouselController = CarouselController();

  int? _currentIndex;

  set currentIndex(int? currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  int? get currentIndex => _currentIndex;
}
