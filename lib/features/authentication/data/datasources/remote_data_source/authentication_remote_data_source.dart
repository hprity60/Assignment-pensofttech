import 'package:assignment_app/features/authentication/data/models/sign_up_request_model.dart';

abstract class SignUpRemoteDataSource {
  Future<SignUpRequestModel> signUp({required SignUpRequestModel signInRequestModel});
}