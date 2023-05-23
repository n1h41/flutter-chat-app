import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../domain/entitites/user.dart';

part 'login_view_state.freezed.dart';

@freezed
class LoginVeiwState with _$LoginVeiwState {
  const factory LoginVeiwState.initial() = _Initial;

  const factory LoginVeiwState.loading() = _Loading;

  const factory LoginVeiwState.error(Failure error) = _Error;

  const factory LoginVeiwState.data(User user) = _Data;
}
