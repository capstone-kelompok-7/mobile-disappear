import 'package:dio/dio.dart';
import 'package:disappear/services/api.dart';
import 'package:flutter/material.dart';

class ProfileService {
  Dio dio = createDio();

  Future<Map<String, dynamic>> getProfile() async {
    try {
      final response = await dio.get('/users/get-profile');
      return response.data;
    } catch (error) {
      debugPrint('Error getting profile: $error');
      rethrow;
    }
  }

  Future<void> editProfile(Map<String, dynamic> data) async {
    try {
      debugPrint('Editing profile. Payload data: $data');

      final response = await dio.post('/users/edit-profile', data: data);

      debugPrint('Edit profile response. Status code: ${response.statusCode}');
      debugPrint('Edit profile response data: ${response.data}');

      if (response.statusCode == 200) {
        debugPrint('Edit profile successful');
      } else {
        debugPrint(
            'Failed to edit profile. Status code: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Error editing profile: $error');
      rethrow;
    }
  }
}
