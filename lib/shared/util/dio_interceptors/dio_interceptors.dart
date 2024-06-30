import 'package:dio/dio.dart';
import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/service/auth_service.dart';
import 'package:hyper_ui/shared/util/log/log.dart';

Dio dio = Dio();

class Diointerceptors {
  static setOptions() {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  static init() {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('----------------------');
          printo("URL: ${options.method} ${options.uri}");
          printo("Headers: ${options.headers}");
          printo("Request Body: ${options.data}");
          print('----------------------');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print('----------------------');
          printg("No Exception");
          printg("Response Data: ${response.data}");
          printg("Response Status Code: ${response.statusCode}");
          print('----------------------');

          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          print('----------------------');
          printr("DioException");
          printr("Response data: ${e.response?.data}");
          printr("Response Status Code: ${e.response?.statusCode}");
          print('----------------------');
          return handler.next(e);
        },
      ),
    );
  }
}