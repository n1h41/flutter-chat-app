import 'package:chat_app/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.error(Failure error) = _Error;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.registered() = _Registered;
}
