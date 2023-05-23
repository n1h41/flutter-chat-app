import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/helpers/secure_storage.dart';

class HomeRepostoryImpl implements HomeRepository {
  HomeRepostoryImpl(this.secureStorage);

  final SecureStorage secureStorage;

  @override
  Future<Either<Failure, bool>> logout() async {
    // TODO: implement logout
    try {
      await secureStorage.deleteAll();
      return const Right(true);
    } catch (e) {
      return const Left(CacheFailure("Error logging out!"));
    }
  }
}
