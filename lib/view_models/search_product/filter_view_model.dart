import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  int _selectedFilter = 0;

  set selectedFilter(int selectedFilter) {
    _selectedFilter = selectedFilter;
    notifyListeners();
  }

  int get selectedFilter => _selectedFilter;
}