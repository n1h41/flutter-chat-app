import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/datasources/data_source.dart';
import '../../../../core/error/failures.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Object> login(UserModel user);
  Future<Either<Failure, String>> register(RegisterUserParams params);
}

class AuthRemoteDataSourceImpl extends DataSource
    implements AuthRemoteDataSource {
  @override
  Future<Object> login(UserModel user) async {
    final result = await api.post('/users/register');
    return result;
  }

  @override
  Future<Either<Failure, String>> register(RegisterUserParams params) async {
    final Map data = params.toJson();
    try {
      final result = await api.post('/users/register', data: data);
      return Right(result.data);
    } on DioError catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['description'] as String? ?? e.message,
        ),
      );
    }
  }
}
