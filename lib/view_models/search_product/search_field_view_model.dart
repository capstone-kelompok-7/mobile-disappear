import 'package:flutter/material.dart';

class SearchFieldViewModel extends ChangeNotifier {
  final searchController = TextEditingController();

  String _keyword = '';

  String get keyword => _keyword;

  set keyword(String keyword) {
    _keyword = keyword;
    notifyListeners();
  }

  SearchFieldViewModel() {
    searchController.addListener(() {
      keyword = searchController.text;
    });
  }
}