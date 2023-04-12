// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../entitites/user.dart';

part 'login_user.freezed.dart';
part 'login_user.g.dart';

class LoginUser {
  final AuthRepository repository;
  LoginUser({
    required this.repository,
  });

  Future<Either<Failure, User>> call(LoginUserParams params) {
    return repository.loginUser(params);
  }
}

@freezed
class LoginUserParams with _$LoginUserParams {
  const factory LoginUserParams({
    required String email,
    required String password,
  }) = _LoginUserParams;

  factory LoginUserParams.fromJson(Map<String, Object?> json) =>
      _$LoginUserParamsFromJson(json);
}
