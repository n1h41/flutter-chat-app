
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failures.dart';

part 'registration_screen_state.freezed.dart';

@freezed
class RegistrationScreenState with _$RegistrationScreenState {
  const factory RegistrationScreenState() = _RegistrationScreenState;

  const factory RegistrationScreenState.loading() = _Loading;
  
  const factory RegistrationScreenState.error(Failure error) = _Error;

  const factory RegistrationScreenState.success() = _Success;
}