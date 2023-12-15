import 'package:disappear/services/article_service.dart';
import 'package:flutter/material.dart';

class BookmarkViewModel extends ChangeNotifier {
  List<int> _bookmarkedArticleIds = [];

  bool isBookmarked(int articleId) {
    return _bookmarkedArticleIds.contains(articleId);
  }

  Future<void> toggleBookmark(int articleId) async {
    bool isBookmarked = _bookmarkedArticleIds.contains(articleId);

    try {
      bool _isBookmarked = await ArticleService().toggleBookmark(articleId, !isBookmarked);

      // Update the bookmarked article IDs se
      if (_isBookmarked) {
        _bookmarkedArticleIds.add(articleId);
      } else {
        _bookmarkedArticleIds.remove(articleId);
      }

      notifyListeners();
    } catch (e) {
      // Handle the error
      print('Error during bookmark toggle: $e');
    }
  }
}
