import 'package:chat_app/core/helpers/api_agent.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late ApiAgent apiAgent;
  late Dio api;

  setUp(() {
    apiAgent = ApiAgent();
    api = apiAgent.dio;
  });

  test(
      "When the access token is expired, new access token should be requested using the refresh token",
      () async {
    await api.post("/auth/sessions/create", data: {
      "email": "nihalninu25@gmail.com",
      "password": "12345678",
    });
  });
}
