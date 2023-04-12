import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/config.dart';

class ApiAgent {
  Dio dio = Dio(_baseOptions);

  static final BaseOptions _baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    baseUrl: Config.BASE_URL,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    followRedirects: true,
    headers: {"Accept": "application/json"},
    validateStatus: (status) => status == 200 || status == 422 || status == 201,
    contentType: "application/json"
  );

  ApiAgent() {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }
}
