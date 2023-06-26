import 'package:chat_app/core/helpers/secure_storage.dart';
import 'package:chat_app/core/helpers/web_socket_agent.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@riverpod
WebSocketAgent webSocketAgent(WebSocketAgentRef ref) {
  return WebSocketAgent(storage: SecureStorage.instance);
}
