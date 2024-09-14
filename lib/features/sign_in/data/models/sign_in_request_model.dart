// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInRequestModel {
  final String userName;
  final String password;
  final int utc;

  SignInRequestModel({
    required this.userName,
    required this.password,
    required this.utc,
  });

  Map<String, dynamic> toJson() {
    return {
      'Username': userName,
      'Password': password,
      'Utc': utc,
    };
  }
}
