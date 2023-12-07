import 'package:disappear/models/article_model.dart';
import 'package:disappear/services/article_service.dart';
import 'package:flutter/material.dart';

class LatestArticlesViewModel extends ChangeNotifier {
  Future<List<ArticleModel>> getLatestArticles() async {
    final articleService = ArticleService();
    return await articleService.getLatestArticles();
  }
}