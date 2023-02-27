import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entitites/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.dataSource);

  final AuthRemoteDataSource dataSource;

  @override
  Future<Either<Failure, Object>> loginUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> registerUser(
      RegisterUserParams params) async {
    final response = await dataSource.register(params);
    return response.fold(
      (failure) => Left(failure),
      (registerReponse) => Right(registerReponse),
    );
  }
}
