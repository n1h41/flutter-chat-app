import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/register_user.dart';
import 'registration_screen_state.dart';

class RegistrationScreenViewModel
    extends StateNotifier<RegistrationScreenState> {
  RegistrationScreenViewModel(RegisterUser usecase)
      : _usecase = usecase,
        super(const RegistrationScreenState());

  final RegisterUser _usecase;

  Future<bool> registerUser(RegisterUserParams params) async {
    state = const RegistrationScreenState.loading();
    final result = await _usecase(params: params);
    return result.fold(
      (l) {
        state = RegistrationScreenState.error(l);
        return true;
      },
      (r) {
        state = const RegistrationScreenState.success();
        return false;
      },
    );
  }
}
