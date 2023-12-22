import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutViewModel extends ChangeNotifier {
  Future<void> logout() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('user-token');
      await prefs.remove('is-logged-in');

      debugPrint('Logout success');
    } catch (error) {
      debugPrint('Error during logout: $error');
    }
  }
}
