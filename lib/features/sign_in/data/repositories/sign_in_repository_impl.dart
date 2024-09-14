// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment_app/features/sign_in/data/datasources/sign_in_remote_data_source.dart';
import 'package:assignment_app/features/sign_in/data/models/sign_in_request_model.dart';
import 'package:assignment_app/features/sign_in/data/models/sign_in_response_model.dart';
import 'package:assignment_app/features/sign_in/domain/repositories/sign_in_rpository.dart';

import '../../../../core/services/secure_storage.dart';
import '../../../../core/values/strings.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteDataSource signInRemoteDataSource;
  SignInRepositoryImpl({
    required this.signInRemoteDataSource,
  });
  @override
  Future<SignInResponseModel> signIn(
      {required SignInRequestModel signInRequestModel}) async {
    final SignInResponseModel signInResponseModel = await signInRemoteDataSource
        .signIn(signInRequestModel: signInRequestModel);

    SecureStorage()
        .storage
        .write(key: AppStrings.token, value: signInResponseModel.result.token);
    SecureStorage().storage.write(
        key: AppStrings.fullName,
        value: signInResponseModel.result.user?.fullName);
    SecureStorage().storage.write(
        key: AppStrings.companyName,
        value: signInResponseModel.result.user?.companyName);
    SecureStorage().storage.write(
        key: AppStrings.email, value: signInResponseModel.result.user?.email);
    SecureStorage().storage.write(
        key: AppStrings.phone, value: signInResponseModel.result.user?.phone);
    SecureStorage().storage.write(
        key: AppStrings.designation,
        value: signInResponseModel.result.user?.designation);
    SecureStorage().storage.write(
        key: AppStrings.joinDate,
        value: signInResponseModel.result.user?.joinDate);
    SecureStorage().storage.write(
        key: AppStrings.regNo, value: signInResponseModel.result.user?.regNo);
    SecureStorage().storage.write(
        key: AppStrings.profilePicture,
        value: signInResponseModel.result.user?.profilePicture);
    return signInResponseModel;
  }
}
