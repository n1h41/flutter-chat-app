import 'package:chat_app/features/auth/presentation/login/controller/state/login_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/login_user.dart';

class LoginViewController extends StateNotifier<LoginVeiwState> {
  LoginViewController(LoginUser usecase)
      : _usecase = usecase,
        super(const LoginVeiwState.initial());

  final LoginUser _usecase;

  Future<void> login(LoginUserParams params) async {
    state = const LoginVeiwState.loading();
    final result = await _usecase(params);
    result.fold(
      (l) {
        state = LoginVeiwState.error(l);
      },
      (r) {
        state = LoginVeiwState.data(r);
      },
    );
  }
}
