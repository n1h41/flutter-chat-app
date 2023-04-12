import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entitites/user.dart';
import '../usecases/login_user.dart';
import '../usecases/register_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> registerUser(RegisterUserParams params);
  Future<Either<Failure, User>> loginUser(LoginUserParams params);
}