import 'package:freezed_annotation/freezed_annotation.dart';

part 'websocket_state.freezed.dart';

@freezed
class WebsocketState with _$WebsocketState {
  const factory WebsocketState({
    @Default(false) bool isConnected,
    Stream? stream,
  }) = _WebsocketState;
}