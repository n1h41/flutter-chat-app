import '../../domain/entitites/user.dart';

class UserModel extends User {
  const UserModel({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? verificationCode,
    String? passwordResetCode,
    bool? verified,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          verificationCode: verificationCode,
          passwordResetCode: passwordResetCode,
          verified: verified,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
        verificationCode: json['verificationCode'],
        passwordResetCode: json['passwordResetCode'],
        verified: json['verified'],
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'verificationCode': verificationCode,
        'passwordResetCode': passwordResetCode,
        'verified': verified,
      }..removeWhere((key, value) => value == null);
}
