import 'package:chat_app/core/helpers/module.dart';
import 'package:chat_app/core/helpers/web_socket_agent.dart';
import 'package:chat_app/features/home/presentation/controller/state/websocket_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'websocket_controller.g.dart';

@riverpod
class WebSocketController extends _$WebSocketController {
  @override
  WebsocketState build() {
    return const WebsocketState(isConnected: false);
  }

  void toggleConnectionStatus() {
    state = state.copyWith(isConnected: !state.isConnected);
  }

  Future<void> establishWebSocketConnection() async {
    final WebSocketAgent agent = ref.watch(webSocketAgentProvider);
    state = state.copyWith(subscription: null);
    await agent.connect();
    state = state.copyWith(
      subscription: agent.stream!.listen(
        (event) {
          debugPrint(event.toString());
          state = state.copyWith(isConnected: true);
        },
        onError: (error) {
          debugPrint(error.toString());
          state = state.copyWith(isConnected: false);
        },
        onDone: () {
          debugPrint("Connection tethered");
          state = state.copyWith(isConnected: false);
        },
      ),
    );
  }

  Future<void> retryConnection() async {
    state.subscription?.cancel();
    final WebSocketAgent agent = ref.watch(webSocketAgentProvider);
    agent.disconnet();
    agent.reconnect();
    await establishWebSocketConnection();
  }
}
