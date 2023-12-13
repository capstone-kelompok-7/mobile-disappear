import 'package:dio/dio.dart';
import 'package:disappear/main.dart';
import 'package:disappear/screens/components/flushbar.dart';
import 'package:disappear/screens/main_screen.dart';
import 'package:disappear/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _isPasswordObscured = true;

  set isPasswordObscured(bool isPasswordObscured) {
    _isPasswordObscured = isPasswordObscured;
    notifyListeners();
  }

  bool get isPasswordObscured => _isPasswordObscured;

  void togglePasswordObscure() {
    isPasswordObscured = !isPasswordObscured;
  }

  bool _isLoading = false;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  String? message;

  set errorMessage(String? errorMessage) {
    message = errorMessage;
    notifyListeners();
  }

  String? get errorMessage => message;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;

      try {
        final authService = AuthService();

        final response = await authService.login(emailController.text, passwordController.text);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user-token', response['data']['access_token']);
        await prefs.setBool('is-logged-in', true);

        // showSuccessFlushbar(message: response['message']);

        _goToHomeScreen();
      } on DioException catch (error) {
        if (error.response != null) {
          if ([400, 401, 404].contains(error.response!.statusCode)) {
            showFailedFlushbar(message: error.response!.data['message']);
          } else {
            showFailedFlushbar(message: 'Terjadi kesalahan pada server.');
          }
        }
      } finally {
        isLoading = false;
      }
    }
  }

  void _goToHomeScreen() {
    Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!, MainScreen.routePath, (route) => false);
  }

  String? validateEmail(value) {
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value!)) {
      return 'Oops... Email yang kamu masukan salah, nih. Coba lagi, yuk!';
    }

    return null;
  }

  String? validatePassword(value) {
    if (value!.length < 6) {
      return 'Oops... Kata sandi yang kamu masukan salah, nih. Coba lagi, yuk!';
    }

    return null;
  }
}