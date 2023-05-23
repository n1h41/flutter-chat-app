import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:chat_app/features/auth/presentation/register/controller/state/registration_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistratonViewController extends StateNotifier<RegistrationViewState> {
  RegistratonViewController(RegisterUser usecase)
      : _usecase = usecase, super(const RegistrationViewState.initial());

  final RegisterUser _usecase;

  Future<void> registerUser(RegisterUserParams params) async {
    state = const RegistrationViewState.loading();
    final result = await _usecase(params: params);
    return result.fold(
      (failure) => state = RegistrationViewState.error(failure),
      (success) => state = const RegistrationViewState.data(),
    );
  }
}
