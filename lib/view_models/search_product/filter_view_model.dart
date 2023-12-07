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

  void togglePromo() {
    withPromo = !withPromo;
  }
}