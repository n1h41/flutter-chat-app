// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? verificationCode;
  final String? passwordResetCode;
  final bool? verified;

  const User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.verificationCode,
    this.passwordResetCode,
    this.verified,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? verificationCode,
    String? passwordResetCode,
    bool? verified,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      verificationCode: verificationCode ?? this.verificationCode,
      passwordResetCode: passwordResetCode ?? this.passwordResetCode,
      verified: verified ?? this.verified,
    );
  }

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      email,
      password,
      verificationCode,
      passwordResetCode,
      verified,
    ];
  }
}
