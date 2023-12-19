import 'package:disappear/models/home/carousel_category_product_model.dart';
import 'package:disappear/models/home/challenge_article.dart';
import 'package:disappear/services/home_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  Future<CarouselCategoryProduct>? carouselCategoryProductFuture;

  Future<ChallengeArticle>? challengeArticleFuture;

  Future<void> getCarouselsCategoriesAndProducts() async {
    final homeService = HomeService();
    carouselCategoryProductFuture ??= homeService.getCarouselsCategoriesAndProducts();
    notifyListeners();
  }

  Future<void> getChallengesAndArticles() async {
    final homeService = HomeService();
    challengeArticleFuture ??= homeService.getChallengesAndArticles();
    notifyListeners();
  }
}