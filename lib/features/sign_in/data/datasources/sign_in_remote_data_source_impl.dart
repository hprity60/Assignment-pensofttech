// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment_app/core/values/strings.dart';
import 'package:dio/dio.dart';

import 'package:assignment_app/features/sign_in/data/datasources/sign_in_remote_data_source.dart';
import 'package:assignment_app/features/sign_in/data/models/sign_in_request_model.dart';
import 'package:assignment_app/features/sign_in/data/models/sign_in_response_model.dart';

import '../../../../core/network/dio_client.dart';

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final DioProvider dio;
  SignInRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<SignInResponseModel> signIn(
      {required SignInRequestModel signInRequestModel}) async {
    try {
      Response response = await dio.client.post(
        AppStrings.signInUrl,
        options: Options(headers: signInRequestModel.toJson()),
      );

      final jsonBody = response.data;
      final signInResponseModel = SignInResponseModel.fromJson(jsonBody);
      return signInResponseModel;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
