import 'package:disappear/services/home_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  Future<Map<dynamic, List>> getCarouselsCategoriesAndProducts() async {
    final homeService = HomeService();
    return await homeService.getCarouselsCategoriesAndProducts();
  }

  Future<Map<dynamic, List>> getChallengesAndArticles() async {
    final homeService = HomeService();
    return await homeService.getChallengesAndArticles();
  }
}