import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  bool _withPromo = false;

  set withPromo(bool withPromo) {
    _withPromo = withPromo;
    notifyListeners();
  }

  bool get withPromo => _withPromo;

  int _selectedFilter = 0;

  set selectedFilter(int selectedFilter) {
    _selectedFilter = selectedFilter;
    notifyListeners();
  }

  int get selectedFilter => _selectedFilter;

  bool _isAsc = true;

  set isAsc(bool isAsc) {
    _isAsc = isAsc;
    notifyListeners();
  }

  bool get isAsc => _isAsc;
}