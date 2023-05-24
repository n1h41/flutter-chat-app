import 'package:chat_app/core/helpers/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../configs/config.dart';
import '../util/utils.dart';

class ApiAgent {
  final Dio dio = Dio(_baseOptions);

  static final BaseOptions _baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    baseUrl: Config.baseUrl,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    followRedirects: true,
    headers: {"Accept": "application/json"},
    validateStatus: (status) => status == 200 || status == 422 || status == 201,
    contentType: "application/json",
  );

  ApiAgent() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    // Todo: Add interceptors for getting new token access token using refresh token
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (Utils.isAuthRoutes(options.path)) {
            return handler.next(options);
          }
          final String refreshToken =
              await SecureStorage.instance.read('refreshToken') ?? '';
          options.headers['Authorization'] = "Bearer $refreshToken";
          return handler.next(options);
        },
        onError: (e, handler) async {
          final RequestOptions? origin = e.response?.requestOptions;
          if (e.response?.statusCode == 401 && origin != null) {
            try {
              Response<dynamic> data = await dio.post('/auth/sessions/refresh');
              await SecureStorage.instance
                  .write('accessToken', data.data['accessToken']);
              origin.headers['Authorization'] =
                  "Bearer ${data.data['accessToken']}";
            } catch (err) {
              Logger().e(err);
            }
          }
          // handler.reject(e);
          handler.next(e);
        },
      ),
    );
  }
}
