import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entitites/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> registerUser(RegisterUserParams params);
  Future<Either<Failure, Object>> loginUser(User user);
}
