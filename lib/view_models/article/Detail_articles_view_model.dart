// ignore_for_file: file_names

import 'package:disappear/models/article_model.dart';
import 'package:disappear/services/article_service.dart';
import 'package:flutter/material.dart';

class DetailArticlesViewModel extends ChangeNotifier {
  Future<List<ArticleModel>> getDetailArticles() async {
    final articleService = ArticleService();
    return await articleService.getLatestArticles();
  }

  int? _articleId;

  set articleId(int? articleId) {
    _articleId = articleId;
  }

  int? get articleId => _articleId;

  Future<ArticleModel?> getArticleById() async {
    if (articleId != null) {
      final articleService = ArticleService();
      return await articleService.getArticleById(articleId!);
    }

    return null;
  }
  
  Future<List<ArticleModel>> getOtherArticles() async {
    final articleService = ArticleService();
    return await articleService.getOtherArticles();
  }
}
