import 'package:chat_app/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_view_state.freezed.dart';

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState.initial() = _Initial;
  const factory HomeViewState.loading() = _Loading;
  const factory  HomeViewState.data() = _Data;
  const factory HomeViewState.error(Failure error) = _Error;
}
