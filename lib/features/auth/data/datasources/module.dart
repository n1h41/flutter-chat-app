import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_remote_data_source.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl();
});