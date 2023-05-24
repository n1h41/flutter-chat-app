import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_remote_data_source.dart';

part 'module.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSourceImpl();
}