import 'package:dio/dio.dart';
import 'package:disappear/services/api.dart';

class AuthService {
  Future<dynamic> login(String email, String password) async {
    final dio = createDio();

    Response response = await dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password
      }
    );

    return response.data;
  }
}