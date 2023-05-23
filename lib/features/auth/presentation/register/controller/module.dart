import 'package:chat_app/features/auth/domain/usecases/module.dart';
import 'package:chat_app/features/auth/presentation/register/controller/registration_view_controller.dart';
import 'package:chat_app/features/auth/presentation/register/controller/state/registration_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registrationViewControllerProvider =
    StateNotifierProvider<RegistratonViewController, RegistrationViewState>(
  (ref) => RegistratonViewController(
    ref.watch(registerUserProvider),
  ),
);
