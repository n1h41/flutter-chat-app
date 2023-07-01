import 'package:chat_app/core/configs/config.dart';
import 'package:chat_app/core/helpers/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketAgent {
  final SecureStorage _storage;

  IOWebSocketChannel? channel;

  WebSocketAgent({required SecureStorage storage}) : _storage = storage;

  Stream<dynamic>? get stream => channel?.stream;

  Future<void> connect() async {
    if (channel != null) {
      return;
    }
    String? accessToken = await _storage.read('accessToken');
    if (accessToken == null) {
      throw Exception('Access token is null');
    }
    Map<String, dynamic> headers = {
      "Bearer": accessToken,
    };
    try {
      channel = IOWebSocketChannel.connect(
        Uri.parse(Config.websocketUrl),
        headers: headers,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void disconnet() {
    channel?.sink.close(status.goingAway);
  }

  void reconnect() {
    channel = null;
  }
}
