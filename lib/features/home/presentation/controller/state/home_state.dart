import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeStateInitial;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.webSocketConnected() = HomeStateWebSocketConnected;
}
