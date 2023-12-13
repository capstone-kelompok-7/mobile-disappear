import 'package:dio/dio.dart';
import 'package:disappear/main.dart';
import 'package:disappear/screens/auth/forgot_password/components/reset_password_failed_dialog.dart';
import 'package:disappear/screens/auth/forgot_password/components/reset_password_success_dialog.dart';
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

  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;

      try {
      final authService = AuthService();
      final response = await authService.resetPassword(
        passwordController.text,
        passwordConfirmationController.text,
        accessToken!
      );
      
      _showSuccessMessage(response['message']);
      } on DioException catch (error) {
        if (error.response != null) {
          if ([400, 401, 404, 500].contains(error.response!.statusCode)) {
            _showFailedMessage(error.response!.data['message']);
          }
        }

        _showFailedMessage('Terjadi kesalahan pada server.');
      } finally {
        isLoading = false;
      }
    }
  }

  void _showSuccessMessage(String message) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => ResetPasswordSuccessDialog(message: message)
    );
  }

  void _showFailedMessage(String message) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => ResetPasswordFailedDialog(message: message)
    );
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