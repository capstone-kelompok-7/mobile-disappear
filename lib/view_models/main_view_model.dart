import 'package:disappear/screens/challenge/challenge_screen.dart';
import 'package:disappear/screens/home/home_screen.dart';
import 'package:disappear/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  final List<Widget> _screens = [
    const HomeScreen(),
    const ChallengeScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  int _selectedScreenIndex = 0;

  int get selectedScreenIndex => _selectedScreenIndex;

  set selectedScreenIndex(int index) {
    _selectedScreenIndex = index;
    notifyListeners();
  }

  Widget get currentScreen => _screens[_selectedScreenIndex];
}