import 'package:dio/dio.dart';
import 'package:disappear/main.dart';
import 'package:disappear/screens/auth/register/components/register_verification_failed_dialog.dart';
import 'package:disappear/screens/auth/register/components/register_verification_success_dialog.dart';
import 'package:disappear/screens/components/flushbar.dart';
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

  Future<void> verifyOTP() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;

      try {
        final authService = AuthService();

        await authService.verifyRegisterOTP(email!, otp);

        _showSuccessMessage('Selamat! Verifikasi email mu berhasil, nih. Silahkan ke step selanjutnya, yuk!');

        clearOTP();
      } on DioException catch (_) {
        _showFailedMessage('Sepertinya kode OTP mu salah atau sudah kadaluwarsa, nih. Coba cek lagi atau klik kirim ulang, yuk!');
      } finally {
        isLoading = false;
      }
    }
  }

  Future<void> resendOTP() async {
    isSendingOTP = true;

    try {
      final authService = AuthService();

      await authService.resendOTP(email!);

      showSuccessFlushbar(message: 'Kode OTP berhasil di kirim ulang!');

      clearOTP();
    } on DioException catch (error) {
      if (error.response != null && error.response!.statusCode == 500) {
        showFailedFlushbar(message: error.response!.data['message']);
      }

      showFailedFlushbar(message: 'Terjadi kesalahan pada server.');
    } finally {
      isSendingOTP = false;
    }
  }

  void _showSuccessMessage(String message) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => RegisterVerificationSuccessDialog(message: message)
    );
  }

  void _showFailedMessage(String message) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => RegisterVerificationFailedDialog(message: message)
    );
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