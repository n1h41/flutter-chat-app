import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/datasource/data_source.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, Map<String, dynamic>>> login(LoginUserParams params);
  Future<Either<Failure, String>> register(RegisterUserParams params);
}

class AuthRemoteDataSourceImpl extends DataSource
    implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      LoginUserParams params) async {
    final Map data = params.toJson();
    try {
      final result = await api.post(
        '/auth/sessions/create',
        data: data,
      );
      return Right(result.data);
    } on DioError catch (e) {
      return Left(
        ServerFailure(
          e.response?.data.toString() ?? e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> register(RegisterUserParams params) async {
    final Map data = params.toJson();
    try {
      final result = await api.post(
        '/users/register',
        data: data,
      );
      return Right(result.data);
    } on DioError catch (e) {
      return Left(
        ServerFailure(
          e.response?.data.toString() ?? e.message,
        ),
      );
    }
  }
}
