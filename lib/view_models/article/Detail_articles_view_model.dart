import 'package:disappear/models/article_model.dart';
import 'package:disappear/services/article_service.dart';
import 'package:flutter/material.dart';

class DetailArticlesViewModel extends ChangeNotifier {
  Future<List<ArticleModel>> getDetailArticles() async {
    final articleService = ArticleService();
    return await articleService.getLatestArticles();
  }
}
