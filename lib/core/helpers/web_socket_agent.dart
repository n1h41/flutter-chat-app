import 'package:chat_app/core/configs/config.dart';
import 'package:chat_app/core/helpers/secure_storage.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketAgent {
  WebSocketAgent._();

  static WebSocketAgent? _instance;

  final SecureStorage _storage = SecureStorage.instance;

  static WebSocketAgent get instance {
    return _instance ?? WebSocketAgent._();
  }

  IOWebSocketChannel? channel;

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
    channel = IOWebSocketChannel.connect(
      Uri.parse(Config.websocketUrl),
      headers: headers,
    );
  }

  void disconnet() {
    channel?.sink.close(status.goingAway);
  }
}
