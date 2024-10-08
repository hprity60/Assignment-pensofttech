import 'package:assignment_app/core/values/strings.dart';
import 'package:dio/dio.dart';

import 'interceptor/error_interceptor.dart';

class DioProvider {
  final Dio _dio;

  DioProvider() : _dio = Dio() {
    _dio.options.baseUrl = AppStrings.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.responseType = ResponseType.json;
    _dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
      ErrorInterceptor(),
    ]);
  }

  Dio get client => _dio;
}
