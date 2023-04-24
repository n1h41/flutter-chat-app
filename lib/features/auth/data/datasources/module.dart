import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_remote_data_source.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl();
});
