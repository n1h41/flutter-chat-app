import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

part 'register_user.freezed.dart';
part 'register_user.g.dart';

class RegisterUser {
  final AuthRepository repository;
  RegisterUser(this.repository);

  Future<Either<Failure, String>> call(
      {required RegisterUserParams params}) async {
    return await repository.registerUser(params);
  }
}

@freezed
class RegisterUserParams with _$RegisterUserParams {
  const factory RegisterUserParams({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) = _RegisterUserParams;

  factory RegisterUserParams.fromJson(Map<String, Object?> json) =>
      _$RegisterUserParamsFromJson(json);
}
