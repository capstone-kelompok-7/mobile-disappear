import 'package:dio/dio.dart';
import 'package:disappear/env/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio createDio() {
  final options = BaseOptions(baseUrl: Env.apiUrl);
  final dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options, RequestInterceptorHandler handler) =>
      requestInterceptor(options, handler)
  ));

  return dio;
}

dynamic requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
  if (options.headers.containsKey('doesntRequireToken')) {
    options.headers.remove('doesntRequireToken');
  } else {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.get('user-token');

    if (token != null) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
  }

  return handler.next(options);
}