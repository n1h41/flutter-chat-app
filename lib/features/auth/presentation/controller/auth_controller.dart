import 'package:chat_app/features/auth/domain/usecases/login_user.dart';
import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:chat_app/features/auth/presentation/controller/state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  final LoginUser _loginUserUsecase;
  final RegisterUser _registerUserUsecase;
  AuthController(this._loginUserUsecase, this._registerUserUsecase)
      : super(const AuthState.unauthenticated());

  Future<void> loginUser(LoginUserParams params) async {
    state = const AuthState.loading();
    final result = await _loginUserUsecase(params);
    result.fold(
      (l) {
        state = AuthState.error(l);
      },
      (r) {
        state = const AuthState.authenticated();
      },
    );
  }

  Future<void> registerUser(RegisterUserParams params) async {
    state = const AuthState.loading();
    final result = await _registerUserUsecase(params: params);
    return result.fold(
      (failure) => state = AuthState.error(failure),
      (success) => state = const AuthState.registered(),
    );
  }

  Future<void> logoutUser() async {
    throw UnimplementedError();
  }

  Future<void> forgotPassword() async {
    throw UnimplementedError();
  }
}
