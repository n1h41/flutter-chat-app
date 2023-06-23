import 'package:chat_app/features/app/controller/module.dart';
import 'package:chat_app/features/auth/domain/usecases/login_user.dart';
import 'package:chat_app/features/auth/domain/usecases/module.dart';
import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:chat_app/features/auth/presentation/controller/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthState.unauthenticated();
  }

  Future<void> loginUser(LoginUserParams params) async {
    state = const AuthState.loading();
    final LoginUser usecase = ref.read(loginUserProvider);
    final result = await usecase(params);
    result.fold(
      (l) {
        state = AuthState.error(l);
      },
      (r) {
        ref.read(appControllerProvider).loginState = true;
        state = const AuthState.authenticated();
      },
    );
  }

  Future<void> registerUser(RegisterUserParams params) async {
    state = const AuthState.loading();
    final RegisterUser usecase = ref.read(registerUserProvider);
    final result = await usecase(params: params);
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

/* class AuthController extends StateNotifier<AuthState> {
  final LoginUser _loginUserUsecase;
  final RegisterUser _registerUserUsecase;
  AuthController(
      {required LoginUser loginUserUsecase,
      required RegisterUser registerUserUsecase})
      : _loginUserUsecase = loginUserUsecase,
        _registerUserUsecase = registerUserUsecase,
        super(const AuthState.unauthenticated());

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
} */
