import 'package:flutter/material.dart';

class SearchFieldViewModel extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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