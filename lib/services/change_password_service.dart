import 'package:dio/dio.dart';
import 'package:disappear/services/api.dart';
import 'package:flutter/material.dart';

class ChangePasswordService {
  final Dio dio = createDio();

  Future<Map<String, dynamic>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await dio.post(
        '/users/change-password',
        data: {
          'old_password': oldPassword,
          'new_password': newPassword,
          'confirm_password': confirmPassword,
        },
      );
      return response.data;
    } catch (error) {
      debugPrint('Error during password change: $error');
      rethrow;
    }
  }
}
