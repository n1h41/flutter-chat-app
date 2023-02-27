import '../util/api_agent.dart';
import 'package:dio/dio.dart';

class DataSource {
  Dio api;

  DataSource() : api = ApiAgent().dio;
}
