import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String _keyUserEmail = 'userEmail';

  static Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserEmail);
  }
}
