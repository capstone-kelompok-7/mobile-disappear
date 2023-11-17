import 'package:disappear/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  int _selectedScreenIndex = 0;

  int get selectedScreenIndex => _selectedScreenIndex;

  set selectedScreenIndex(int index) {
    _selectedScreenIndex = index;
    notifyListeners();
  }

  Widget get currentScreen => _screens[_selectedScreenIndex];
}