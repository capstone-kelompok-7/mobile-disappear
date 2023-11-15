import 'package:disappear/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _screens = [
    { 'title': 'Beranda', 'screen': const HomeScreen() },
    { 'title': 'Tantangan', 'screen': const HomeScreen() },
    { 'title': 'Pesanan', 'screen': const HomeScreen() },
    { 'title': 'Profil', 'screen': const HomeScreen() },
  ];

  int _selectedScreenIndex = 0;

  int get selectedScreenIndex => _selectedScreenIndex;

  set selectedScreenIndex(int index) {
    _selectedScreenIndex = index;
    notifyListeners();
  }

  String get currentScreenTitle => _screens[_selectedScreenIndex]['title'];

  Widget get currentScreen => _screens[_selectedScreenIndex]['screen'];
}