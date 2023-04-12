import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/login_user.dart';
import 'login_screen_state.dart';

class LoginScreenStateNotifier extends StateNotifier<LoginScreenState> {
  LoginScreenStateNotifier(LoginUser usecase)
      : _usecase = usecase,
        super(const LoginScreenState(stateType: LoginScreenStateType.initial));

  final LoginUser _usecase;

  Future<void> login(LoginUserParams params) async {
    state = state.copyWith(stateType: LoginScreenStateType.loading);
    final result = await _usecase(params);
    return result.fold(
      (l) {
        state = state.copyWith(stateType: LoginScreenStateType.error, error: l);
      },
      (r) {
        state = state.copyWith(
          stateType: LoginScreenStateType.success,
          user: r,
        );
      },
    );
  }
}
