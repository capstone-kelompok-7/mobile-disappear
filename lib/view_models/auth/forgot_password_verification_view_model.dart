import 'package:dio/dio.dart';
import 'package:disappear/services/auth_service.dart';
import 'package:flutter/material.dart';

class ForgotPasswordVerificationViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  TextEditingController code5 = TextEditingController();
  TextEditingController code6 = TextEditingController();

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

  bool _isOTPCorrect = false;

  set isOTPCorrect(bool isOTPCorrect) {
    _isOTPCorrect = isOTPCorrect;
    notifyListeners();
  }

  bool get isOTPCorrect => _isOTPCorrect;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      isOTPCorrect = false;

      try {
      final authService = AuthService();

      // final response = await authService.verifyForgotPasswordOTP();
      // message = response['message'];

      isOTPCorrect = true;
      } on DioException catch (error) {
        if (error.response != null) {
          if ([400, 401, 404, 500].contains(error.response!.statusCode)) {
            message = error.response!.data['message'];
          }
        }
      } finally {
        isLoading = false;
      }
    }
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