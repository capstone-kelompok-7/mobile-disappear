import 'package:dio/dio.dart';
import 'package:disappear/main.dart';
import 'package:disappear/screens/auth/forgot_password/components/forgot_password_success_dialog.dart';
import 'package:disappear/screens/components/flushbar.dart';
import 'package:disappear/services/auth_service.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

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

  bool _isEmailSent = false;

  set isEmailSent(bool isEmailSent) {
    _isEmailSent = isEmailSent;
    notifyListeners();
  }

  bool get isEmailSent => _isEmailSent;

  Future<void> sendEmail() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;

      try {
        final authService = AuthService();
        final response = await authService.sendResetPasswordEmail(emailController.text);
        
        _showSuccessMessage(response['message']);

        isEmailSent = true;
      } on DioException catch (error) {
        if (error.response != null) {
          if ([400, 401, 404, 500].contains(error.response!.statusCode)) {
            _showFailedMessage(error.response!.data['message']);
          }
        } else {
          _showFailedMessage('Terjadi kesalahan pada server.');
        }

        isEmailSent = false;
      } finally {
        isLoading = false;
      }
    }
  }

  void _showSuccessMessage(String message) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => ForgotPasswordSuccessDialog(message: message)
    );
  }

  void _showFailedMessage(String message) => showFailedFlushbar(message: message);

  String? validateEmail(value) {
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value!)) {
      return 'Email tidak valid';
    }

    return null;
  }
}