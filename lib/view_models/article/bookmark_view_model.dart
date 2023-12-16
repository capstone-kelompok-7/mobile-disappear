import 'package:dio/dio.dart';
import 'package:disappear/screens/components/flushbar.dart';
import 'package:disappear/services/article_service.dart';
import 'package:flutter/material.dart';

class BookmarkViewModel extends ChangeNotifier {
  List<int> _bookmarkedArticleIds = [];

  bool isBookmarked(int articleId) {
    return _bookmarkedArticleIds.contains(articleId);
  }

  Future<void> getBookmarkedArticleIds() async {
    try {
      final service = ArticleService();
      
      _bookmarkedArticleIds = await service.getBookmarkedArticleIds();

      notifyListeners();
    } on DioException catch (e) {
      // Handle the error
      debugPrint('Error during bookmark toggle: $e');
      showFailedFlushbar(message: 'Terjadi kesalahan saat bookmark artikel');
    }
  }

  Future<void> toggleBookmark(int articleId) async {
    try {
      final service = ArticleService();

      if (isBookmarked(articleId)) {
        await service.deleteBookmark(articleId);
        _bookmarkedArticleIds.remove(articleId);
        showSuccessFlushbar(message: 'Artikel berhasil dihapus');
      } else {
        await service.saveBookmark(articleId);
        _bookmarkedArticleIds.add(articleId);
        showSuccessFlushbar(message: 'Artikel berhasil disimpan');
      }

      notifyListeners();
    } on DioException catch (e) {
      // Handle the error
      debugPrint('Error during bookmark toggle: $e');
      showFailedFlushbar(message: 'Terjadi kesalahan saat bookmark artikel');
    }
  }
}
