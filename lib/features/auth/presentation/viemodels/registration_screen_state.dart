// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationScreenState {
  RegistrationScreenState(
    this.loading, {
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
  });

  final bool loading;
  final bool obscurePassword;
  final bool obscureConfirmPassword;

  RegistrationScreenState copyWith({
    bool? loading,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
  }) {
    return RegistrationScreenState(
      loading ?? this.loading,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
    );
  }

  @override
  String toString() => 'RegistrationScreenState(loading: $loading, obscurePassword: $obscurePassword, obscureConfirmPassword: $obscureConfirmPassword)';
}

class RegistrationScreenViewModel
    extends StateNotifier<RegistrationScreenState> {
  RegistrationScreenViewModel() : super(RegistrationScreenState(false));

  set loading(bool value) {
    state = state.copyWith(loading: value);
  }

  set togglePasswordVisibility(bool value) {
    state = state.copyWith(obscurePassword: value);
  }

  set toggleConfirmPasswordVisibility(bool value) {
    state = state.copyWith(obscureConfirmPassword: value);
  }
}

final registrationScreenViewModelProvider =
    StateNotifierProvider.autoDispose<RegistrationScreenViewModel, RegistrationScreenState>(
        (ref) => RegistrationScreenViewModel());
