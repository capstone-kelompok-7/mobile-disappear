import 'package:dio/dio.dart';

class AuthService {
  Future<dynamic> login(String email, String password) async {
    final dio = Dio();

    Response response = await dio.post(
      'https://test.disappear-organization.my.id/api/v1/auth/login',
      data: {
        'email': email,
        'password': password
      }
    );

    return response.data;
  }
}