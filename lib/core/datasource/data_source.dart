import 'package:dio/dio.dart';

import '../util/api_agent.dart';

class DataSource {
  Dio api;

  DataSource() : api = ApiAgent().dio;
}
