import 'package:dio/dio.dart';
import 'package:disappear/models/article/bookmarked_article_model.dart' as bookmarked;
import 'package:disappear/models/article_model.dart';
import 'package:disappear/services/api.dart';
import 'package:flutter/material.dart';

class ArticleService {
  Future<List<Article>> getLatestArticles() async {
    final dio = createDio();

    final Response response = await dio.get('/articles/latest-article');

    return response.data['data'].map<Article>((data) => Article.fromMap(data)).toList();
  }

  Future<List<Article>> getOtherArticles() async {
    final dio = createDio();

    final Response response = await dio.get('/articles/other-article');
    
    return response.data['data'].map<Article>((data) => Article.fromMap(data)).toList();
  }

  Future<Article> getArticleById(int id) async {
    final dio = createDio();

    final Response response = await dio.get('/articles/$id');
    final data = response.data['data'];

    return Article.fromMap(data);
  }

  Future<List<Article>> getArticle({
    required int page,
    int sortOptions = 0,
  }) async {
    final dio = createDio();

    String filter = '';

    if (sortOptions == 0) {
      filter = 'terbanyak';
    } else if (sortOptions == 1) {
      filter = 'terlama';
    } else if (sortOptions == 2) {
      filter = 'abjad';
    }

    final Response response =
        await dio.get('/articles/preferences?page=$page&filter=$filter');

    if (response.data['data'] != null) {
      return response.data['data'].map<Article>((data) => Article.fromMap(data)).toList();
    }

    return [];
  }

  Future<List<int>> getBookmarkedArticleIds() async {
    final dio = createDio();

    final Response response = await dio.get('/articles/bookmark');

    if (response.data['data'] != null) {
      return response.data['data'].map<int>((data) => data['article_id'] as int).toList();
    }

    return [];
  }

  Future<List<bookmarked.BookmarkedArticle>> getBookmarkedArticles() async {
    final dio = createDio();

    final Response response = await dio.get('/articles/bookmark');

    return response.data['data'].map<bookmarked.BookmarkedArticle>((data) => bookmarked.BookmarkedArticle.fromMap(data)).toList();
  }

  Future<void> saveBookmark(int id) async {
    final dio = createDio();

    try {
      await dio.post('/articles/bookmark', data: {'article_id': id});
    } on DioException catch (e) {
      debugPrint('Error during bookmark toggle: ${e.response}');
      rethrow;
    }
  }

  Future<void> deleteBookmark(int id) async {
    final dio = createDio();

    try {
      await dio.delete('/articles/bookmark/$id');
    } on DioException catch (e) {
      debugPrint('Error during bookmark toggle: ${e.response}');
      rethrow;
    }
  }
}
