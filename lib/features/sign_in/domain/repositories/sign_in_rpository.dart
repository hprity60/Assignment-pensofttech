import '../../data/models/sign_in_request_model.dart';
import '../../data/models/sign_in_response_model.dart';

abstract class SignInRepository {
  Future<SignInResponseModel> signIn({required SignInRequestModel signInRequestModel});
  
}