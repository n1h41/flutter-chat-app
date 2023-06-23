import 'package:chat_app/core/helpers/web_socket_agent.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'websocket_controller.g.dart';

enum WebsocketConnectionStatus { connected, disconnected }

@riverpod
WebsocketController websocketController(WebsocketControllerRef ref) {
  final instance = WebsocketController(webSocketAgent: WebSocketAgent.instance);
  debugPrint('websocketController created');
  ref.onDispose(() {
    debugPrint('websocketController disposed');
  });
  return instance;
}

class WebsocketController extends ChangeNotifier {
  final WebSocketAgent _webSocketAgent;

  WebsocketController({required WebSocketAgent webSocketAgent})
      : _webSocketAgent = webSocketAgent;

  WebsocketConnectionStatus _connectionStatus =
      WebsocketConnectionStatus.disconnected;

  WebsocketConnectionStatus get connectionStatus => _connectionStatus;

  set connectionStatus(WebsocketConnectionStatus value) {
    _connectionStatus = value;
    notifyListeners();
  }

  Future<void> initiateWebsocketConnection() async {
    try {
      await _webSocketAgent.connect();
      connectionStatus = WebsocketConnectionStatus.connected;
      _webSocketAgent.stream!.listen(
        (event) {
          debugPrint('event: $event');
        },
        onError: (error) {
          debugPrint('error: $error');
          connectionStatus = WebsocketConnectionStatus.disconnected;
        },
        onDone: () {
          debugPrint('done');
          connectionStatus = WebsocketConnectionStatus.disconnected;
        },
      );
    } catch (e) {
      _connectionStatus = WebsocketConnectionStatus.disconnected;
      debugPrint('error: $e');
    }
  }

  @override
  void dispose() {
    _webSocketAgent.disconnet();
    super.dispose();
  }
}
