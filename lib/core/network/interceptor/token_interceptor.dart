import 'package:dio/dio.dart';

import '../../services/secure_storage.dart';
import '../../values/strings.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authToken = await SecureStorage().storage.read(key: AppStrings.token);
    // Add the authentication token to the request headers
    options.headers['Authorization'] = 'Bearer $authToken';
    return super.onRequest(options, handler);
  }
}
