import 'package:chat_app/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class Logout {
  Logout(this.repository);

  final HomeRepository repository;

  Future<Either<Failure, bool>> call() async {
    return repository.logout();
  }
}

