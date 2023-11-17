import 'package:dio/dio.dart';
import 'package:disappear/env/env.dart';

class AuthService {
  Future<dynamic> login(String email, String password) async {
    final dio = Dio();

    Response response = await dio.post(
      '${Env.apiUrl}/auth/login',
      data: {
        'email': email,
        'password': password
      }
    );

    return response.data;
  }
}