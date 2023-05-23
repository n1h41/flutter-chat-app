import 'package:dio/dio.dart';

import '../helpers/api_agent.dart';

class DataSource {
  Dio api;

  DataSource() : api = ApiAgent().dio;
}
