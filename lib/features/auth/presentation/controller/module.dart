import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:chat_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:chat_app/features/auth/presentation/controller/state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/module.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final RegisterUser registerUser = ref.read(registerUserProvider);
    final LoginUser loginUser = ref.read(loginUserProvider);
    return AuthController(loginUser, registerUser);
  },
);
