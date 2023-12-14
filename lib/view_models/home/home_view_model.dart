import 'package:disappear/models/home/carousel_category_product_model.dart';
import 'package:disappear/models/home/challenge_article.dart';
import 'package:disappear/services/home_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  Future<CarouselCategoryProduct> getCarouselsCategoriesAndProducts() async {
    final homeService = HomeService();
    return await homeService.getCarouselsCategoriesAndProducts();
  }

  Future<ChallengeArticle> getChallengesAndArticles() async {
    final homeService = HomeService();
    return await homeService.getChallengesAndArticles();
  }
}