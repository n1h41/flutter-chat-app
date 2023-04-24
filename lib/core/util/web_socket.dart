import 'package:web_socket_channel/web_socket_channel.dart';

import '../helpers/config.dart';

class WebSocket {
  WebSocket._();

  static late WebSocket? _instance;

  get instance {
    _instance ??= WebSocket._();
    return _instance;
  }

  WebSocketChannel connect() {
    return WebSocketChannel.connect(Uri.parse(Config.websocketUrl));
  }
}
