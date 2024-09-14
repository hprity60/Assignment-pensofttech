class SignInResponseModel {
  final Result result;
  final bool success;
  final String error;

  SignInResponseModel({
    required this.result,
    required this.success,
    required this.error,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      result:
          json['result'] != null ? Result.fromJson(json['result']) : Result(),
      success: json['success'],
      error: json['error'],
    );
  }
}

class Result {
  final String? token;
  final String? expires_in;
  final String? validTo;
  final User? user;

  Result({
    this.token,
    this.expires_in,
    this.validTo,
    this.user,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      token: json['token'],
      expires_in: json['expires_in'],
      validTo: json['validTo'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String companyId;
  final String companyName;
  final String profilePicture;
  final String userGuidId;
  final int userIntId;
  final int userGroupId;
  final String fullName;
  final String phone;
  final String email;
  final String designation;
  final String regNo;
  final String joinDate;

  User({
    required this.companyId,
    required this.companyName,
    required this.profilePicture,
    required this.userGuidId,
    required this.userIntId,
    required this.userGroupId,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.designation,
    required this.regNo,
    required this.joinDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      companyId: json['companyId'] ?? "",
      companyName: json['companyName'] ?? "",
      profilePicture: json['profilePicture'] ?? "",
      userGuidId: json['userGuidId'] ?? "",
      userIntId: json['userIntId'] ?? "",
      userGroupId: json['userGroupId'] ?? "",
      fullName: json['fullName'] ?? "",
      phone: json['phone'] ?? "",
      email: json['email'] ?? "",
      designation: json['designation'] ?? "",
      regNo: json['regNo'] ?? "",
      joinDate: json['joinDate'] ?? "",
    );
  }
}
