import 'package:disappear/services/change_password_service.dart';
import 'package:flutter/material.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  final ChangePasswordService _changePasswordService = ChangePasswordService();
  String _oldPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';
  String _responseMessage = '';

  String get responseMessage => _responseMessage;

  void setOldPassword(String value) {
    _oldPassword = value;
  }

  void setNewPassword(String value) {
    _newPassword = value;
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
  }

  Future<void> changePassword() async {
    try {
      final response = await _changePasswordService.changePassword(
        oldPassword: _oldPassword,
        newPassword: _newPassword,
        confirmPassword: _confirmPassword,
      );

      _responseMessage = response['message'];

      notifyListeners();
    } catch (error) {
      debugPrint('Error during password change: $error');
    }
  }
}
