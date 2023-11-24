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

  Future<dynamic> register(String email, String password) async {
    final dio = createDio();

    Response response = await dio.post(
      '/auth/register',
      data: {
        'email': email,
        'password': password
      }
    );

    return response.data;
  }

  Future<dynamic> verifyRegisterOTP(String email, String otp) async {
    final dio = createDio();

    Response response = await dio.post(
      '/auth/verify',
      data: {
        'email': email,
        'otp': otp
      }
    );

    return response.data;
  }

  Future<dynamic> resendOTP(String email) async {
    final dio = createDio();

    Response response = await dio.post(
      '/auth/resend-otp',
      data: {
        'email': email
      }
    );

    return response.data;
  }

  Future<dynamic> sendResetPasswordEmail(String email) async {
    final dio = createDio();

    Response response = await dio.post(
      '/auth/forgot-password',
      data: {
        'email': email
      }
    );

    return response.data;
  }
  
  Future<dynamic> verifyForgotPasswordOTP(String email, String otp) async {
    final dio = createDio();

    Response response = await dio.post(
      '/auth/forgot-password/verify',
      data: {
        'email': email,
        'otp': otp
      }
    );

    return response.data;
  }

  Future<dynamic> resetPassword(String newPassword, String confirmPassword, String accessToken) async {
    final dio = createDio();

    Response response = await dio.post(
      '/auth/forgot-password/reset',
      options: Options(
        headers: {
          'doesntRequireToken': true,
          'Authorization': 'Bearer $accessToken',
        }
      ),
      data: {
        'new_password': newPassword,
        'confirm_password': confirmPassword
      }
    );

    return response.data;
  }
}