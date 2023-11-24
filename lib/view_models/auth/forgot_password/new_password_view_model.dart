import 'package:dio/dio.dart';
import 'package:disappear/services/auth_service.dart';
import 'package:flutter/material.dart';

class NewPasswordViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  
  final passwordConfirmationController = TextEditingController();

  bool _isPasswordConfirmationObscured = true;

  set isPasswordConfirmationObscured(bool isPasswordConfirmationObscured) {
    _isPasswordConfirmationObscured = isPasswordConfirmationObscured;
    notifyListeners();
  }

  bool get isPasswordConfirmationObscured => _isPasswordConfirmationObscured;

  void togglePasswordConfirmationObscure() {
    isPasswordConfirmationObscured = !isPasswordConfirmationObscured;
  }

  String? _accessToken;

  set accessToken(String? accessToken) {
    _accessToken = accessToken;
  }

  String? get accessToken => _accessToken;

  bool _isLoading = false;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  String? _message;

  set message(String? message) {
    _message = message;
    notifyListeners();
  }

  String? get message => _message;

  bool? _isPasswordReset;

  set isPasswordReset(bool? isPasswordReset) {
    _isPasswordReset = isPasswordReset;
    notifyListeners();
  }

  bool? get isPasswordReset => _isPasswordReset;

  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      isPasswordReset = null;

      try {
      final authService = AuthService();

      final response = await authService.resetPassword(
        passwordController.text,
        passwordConfirmationController.text,
        accessToken!
      );
      message = response['message'];

      isPasswordReset = true;
      } on DioException catch (error) {
        if (error.response != null) {
          if ([400, 401, 404, 500].contains(error.response!.statusCode)) {
            message = error.response!.data['message'];
            isPasswordReset = false;
          }
        }
      } finally {
        isLoading = false;
      }
    }
  }

  String? validatePassword(value) {
    if (value!.length < 8) {
      return 'Kata sandi minimal berisi 8 karakter';
    }

    return null;
  }

  String? validatePasswordConfirmation(value) {
    if (value != passwordController.text) {
      return 'Kata sandi tidak sama';
    }

    return null;
  }
}