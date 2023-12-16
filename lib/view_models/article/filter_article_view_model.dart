import 'package:disappear/models/article_model.dart';
import 'package:disappear/services/article_service.dart';
import 'package:flutter/material.dart';

class ArticleFilterViewModel extends ChangeNotifier {
  final ArticleService _articleService = ArticleService();

  List<ArticleModel> _articles = [];

  int _currentPage = 1;

  int _sortOption = 0;

  // Getter untuk mendapatkan daftar artikel
  List<ArticleModel> get articles => _articles;

  // Getter untuk mendapatkan halaman saat ini
  int get currentPage => _currentPage;

  // Getter untuk mendapatkan opsi sort saat ini
  int get sortOption => _sortOption;

  // Fungsi untuk mengganti opsi sort
  Future<void> changeSortOption(int option) async {
    _sortOption = option;
    _currentPage = 1; // Reset halaman ke 1 setiap kali opsi sort berubah

    _articles = [];
    isInitialLoading = true;
    notifyListeners();

    await fetchArticles();
  }

  // Loading saat pertama kali untuk mendapatkan artikel
  bool isInitialLoading = true;

  // Loading saat ngescroll untuk mendapatkan artikel
  bool _isLoading = false;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  // Fungsi untuk mendapatkan artikel
  Future<void> fetchArticles() async {
    List<ArticleModel> newArticles = await _articleService.getArticle(
      page: _currentPage,
      sortOptions: _sortOption,
    );

    if (newArticles.isNotEmpty) {
      if (_currentPage == 1) {
        _articles = newArticles;
      } else {
        _articles.addAll(newArticles);
      }

      _currentPage++;
    }

    isLoading = false;
    isInitialLoading = false;
    notifyListeners();
  }
}
