import 'package:disappear/models/article_model.dart';
import 'package:disappear/services/article_service.dart';
import 'package:flutter/foundation.dart';

class GetArticleViewModel extends ChangeNotifier {
  bool _isOnSearch = false;

  set isOnSearch(bool isOnSearch) {
    _isOnSearch = isOnSearch;
    notifyListeners();
  }

  bool get isOnSearch => _isOnSearch;

  bool _isSearching = false;

  set isSearching(bool isSearching) {
    _isSearching = isSearching;
    notifyListeners();
  }

  bool get isSearching => _isSearching;

  List<Article> _articles = [];

  set articles(List<Article> articles) {
    _articles = articles;
    notifyListeners();
  }

  List<Article> get articles => _articles;

  int _page = 1;

  set page(int page) {
    _page = page;
    notifyListeners();
  }

  int get page => _page;

  //Fungsi untuk mengambil data artikel
  Future<void> getArticle({
    int sortOptions = 0,
  }) async {
    page = 1;

    final articleService = ArticleService();
    articles = await articleService.getArticle(
      page: page,
      sortOptions: sortOptions,
    );
  }

  Future<void> getMoreArticle({
    int sortOptions = 0,
  }) async {
    page++;

    final articleService = ArticleService();
    final newArticle = await articleService.getArticle(
      page: page,
      sortOptions: sortOptions,
    );

    articles = [...articles, ...newArticle];
  }
}
