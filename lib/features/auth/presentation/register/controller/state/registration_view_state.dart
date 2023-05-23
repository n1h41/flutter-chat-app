import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/error/failures.dart';

part 'registration_view_state.freezed.dart';

@freezed
class RegistrationViewState with  _$RegistrationViewState {
  const factory RegistrationViewState.initial() = _Initial;
  const factory RegistrationViewState.loading() = _Loading;
  const factory RegistrationViewState.data() = _Data;
  const factory RegistrationViewState.error(Failure error) = _Error;
}
