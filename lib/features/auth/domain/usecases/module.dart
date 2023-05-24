import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/module.dart';
import 'login_user.dart';
import 'register_user.dart';

part 'module.g.dart';

@riverpod
RegisterUser registerUser(RegisterUserRef ref) {
  return RegisterUser(ref.read(authRepositoryProvider));
}

@riverpod
LoginUser loginUser(LoginUserRef ref) {
  return LoginUser(repository: ref.read(authRepositoryProvider));
}
