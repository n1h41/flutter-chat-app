import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/helpers/secure_storage.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/module.dart';
import 'auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDataSourceProvider),
    SecureStorage.instance,
  );
});
