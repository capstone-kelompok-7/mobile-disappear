import 'package:dio/dio.dart';
import 'package:disappear/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterVerificationViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _email;

  set email(String? email) {
    _email = email;
    notifyListeners();
  }

  String? get email => _email;
  
  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  TextEditingController code5 = TextEditingController();
  TextEditingController code6 = TextEditingController();

  String get otp => '${code1.text}${code2.text}${code3.text}${code4.text}${code5.text}${code6.text}';

  bool isOTPEmpty() {
    return code1.text.isEmpty
      && code2.text.isEmpty
      && code3.text.isEmpty
      && code4.text.isEmpty
      && code5.text.isEmpty
      && code6.text.isEmpty;
  }

  bool _isLoading = false;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  bool _isSendingOTP = false;

  set isSendingOTP(bool isSendingOTP) {
    _isSendingOTP = isSendingOTP;
    notifyListeners();
  }

  bool get isSendingOTP => _isSendingOTP;

  bool? _isOTPSent;

  set isOTPSent(bool? isOTPSent) {
    _isOTPSent = isOTPSent;
    notifyListeners();
  }

  bool? get isOTPSent => _isOTPSent;

  String? _message;

  set message(String? message) {
    _message = message;
    notifyListeners();
  }

  String? get message => _message;

  bool? _isOTPCorrect;

  set isOTPCorrect(bool? isOTPCorrect) {
    _isOTPCorrect = isOTPCorrect;
    notifyListeners();
  }

  bool? get isOTPCorrect => _isOTPCorrect;

  Future<void> verifyOTP() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      isOTPCorrect = null;

      try {
        final authService = AuthService();

        final response = await authService.verifyRegisterOTP(email!, otp);
        message = response['message'];

        isOTPCorrect = true;

        clearOTP();
      } on DioException catch (error) {
        if (error.response != null) {
          if (error.response!.statusCode == 400) {
            message = error.response!.data['message'];
          } else {
            message = 'Terjadi kesalahan pada server.';
          }

          isOTPCorrect = false;
        }
      } finally {
        isLoading = false;
      }
    }
  }

  Future<void> resendOTP() async {
    isSendingOTP = true;
    isOTPSent = null;

    try {
      final authService = AuthService();

      final response = await authService.resendOTP(email!);
      message = response['message'];

      isOTPSent = true;

      clearOTP();
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 400) {
          message = error.response!.data['message'];
        } else {
          message = 'Terjadi kesalahan pada server.';
        }

        isOTPSent = false;
      }
    } finally {
      isSendingOTP = false;
    }
  }

  void clearOTP() {
    code1.clear();
    code2.clear();
    code3.clear();
    code4.clear();
    code5.clear();
    code6.clear();
  }
}