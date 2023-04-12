import 'package:json_annotation/json_annotation.dart';

import '../../domain/entitites/user.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
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

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
