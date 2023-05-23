import 'package:chat_app/features/auth/domain/usecases/module.dart';
import 'package:chat_app/features/auth/presentation/login/controller/login_view_controller.dart';
import 'package:chat_app/features/auth/presentation/login/controller/state/login_view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginVewControllerProvider =
    StateNotifierProvider<LoginViewController, LoginVeiwState>(
  (ref) => LoginViewController(
    ref.watch(loginUserProvider),
  ),
);
