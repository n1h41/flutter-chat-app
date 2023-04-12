import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/secure_storage.dart';
import '../../../../core/util/storage.dart';
import '../../domain/entitites/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.dataSource, this.storage);

  final AuthRemoteDataSource dataSource;
  final SecureStorage storage;

  void saveTokens({required Map<String, dynamic> tokens}) async {
    await storage.write('accessToken', tokens['accessToken']);
    await storage.write('refreshToken', tokens['refreshToken']);
  }

  @override
  Future<Either<Failure, User>> loginUser(LoginUserParams params) async {
    final response = await dataSource.login(params);
    return response.fold(
      (failure) => Left(failure),
      (loginResponse) async {
        await Storage().setValue<bool>('isLoggedIn', true);
        saveTokens(tokens: loginResponse);
        return Right(UserModel.fromJson(loginResponse['payload']));
      },
    );
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
