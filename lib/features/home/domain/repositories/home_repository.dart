import 'package:chat_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, bool>> logout();
}
