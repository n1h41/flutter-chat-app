import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/module.dart';
import 'login_user.dart';
import 'register_user.dart';

final registerUserProvider = Provider<RegisterUser>(
  (ref) => RegisterUser(
    ref.watch(authRepositoryProvider),
  ),
);

final loginUserProvider = Provider<LoginUser>(
  (ref) => LoginUser(
    repository: ref.watch(authRepositoryProvider),
  ),
);
