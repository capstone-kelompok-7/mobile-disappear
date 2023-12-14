import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutViewModel extends ChangeNotifier {
  bool _isLoggingOut = false;
  bool get isLoggingOut => _isLoggingOut;

  Future<void> logout() async {
    try {
      _isLoggingOut = true;
      notifyListeners();

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('user-token');

      debugPrint('Logout success');
    } catch (error) {
      debugPrint('Error during logout: $error');
    } finally {
      _isLoggingOut = false;
      notifyListeners();
    }
  }
}
