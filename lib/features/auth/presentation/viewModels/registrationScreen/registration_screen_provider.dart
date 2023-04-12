import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/module.dart';
import 'registration_screen_state.dart';
import 'registration_screen_view_model.dart';

final registrationScreenViewModelProvider = StateNotifierProvider<RegistrationScreenViewModel, RegistrationScreenState>(
  (ref) => RegistrationScreenViewModel(
    ref.watch(registerUserProvider),
  ),
);
