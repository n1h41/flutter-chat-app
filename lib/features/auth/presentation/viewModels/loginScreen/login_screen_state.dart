// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entitites/user.dart';

part 'login_screen_state.freezed.dart';

enum LoginScreenStateType { initial, loading, success, error }

@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    LoginScreenStateType? stateType,
    Failure? error,
    User? user,
  }) = _LoginScreenState;
}
