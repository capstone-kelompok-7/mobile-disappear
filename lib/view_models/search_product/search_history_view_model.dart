import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryViewModel extends ChangeNotifier {
  SearchHistoryViewModel() {
    getHistories();
  }

  List<String> _histories = [];

  List<String> get histories => _histories;

  set histories(List<String> histories) {
    _histories = histories;
    notifyListeners();
  }

  List<String> getHistoriesByKeyword(String keyword) {
    return _histories
      .where((String history) => history.toLowerCase().contains(keyword.toLowerCase()))
      .toList();
  }

  void addHistory(String? keyword) {
    if (keyword != null && keyword != '') {
      if (!_histories.contains(keyword)) {
        _histories.add(keyword);
        notifyListeners();
        saveHistories();
      }
    }
  }

  Future<void> saveHistories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('search-histories', jsonEncode(_histories));
  }

  Future<void> clearHistory(String history) async {
    _histories.removeWhere((element) => element == history);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('search-histories', jsonEncode(_histories));

    notifyListeners();
  }

  Future<void> getHistories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedHistories = prefs.getString('search-histories') ?? '';

    if (savedHistories.isNotEmpty) {
      histories = (jsonDecode(savedHistories) as List<dynamic>)
        .map<String>((dynamic e) => e.toString())
        .toList();
    }
  }
}