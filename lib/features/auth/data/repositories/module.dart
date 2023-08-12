import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/helpers/secure_storage.dart';
import '../../../../core/helpers/shared_prefs.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/module.dart';
import 'auth_repository_impl.dart';

part 'module.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDataSourceProvider),
    SecureStorage.instance,
    ref.read(prefsProvider),
  );
}