import 'package:disappear/services/article_service.dart';
import 'package:flutter/material.dart';

class BookmarkViewModel extends ChangeNotifier {
  Set<int> _bookmarkedArticleIds = {};

  bool isBookmarked(int articleId) {
    return _bookmarkedArticleIds.contains(articleId);
  }

  Future<void> toggleBookmark(int articleId) async {
    bool isBookmarked = _bookmarkedArticleIds.contains(articleId);

    debugPrint(articleId.toString());

    try {
      List<int> updatedBookmarks =
          await ArticleService().toggleBookmark(articleId, !isBookmarked);

      // Update the bookmarked article IDs set
      _bookmarkedArticleIds = Set<int>.from(updatedBookmarks);

      notifyListeners();
    } catch (e) {
      // Handle the error
      print('Error during bookmark toggle: $e');
    }
  }
}
