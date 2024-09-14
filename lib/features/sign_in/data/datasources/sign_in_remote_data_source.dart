import '../models/sign_in_request_model.dart';
import '../models/sign_in_response_model.dart';

abstract class SignInRemoteDataSource {
  Future<SignInResponseModel> signIn({required SignInRequestModel signInRequestModel});
}
