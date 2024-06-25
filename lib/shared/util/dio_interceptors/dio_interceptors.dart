import 'package:dio/dio.dart';
import 'package:hyper_ui/shared/util/log/log.dart';

Dio dio = Dio();

class Diointerceptors {
  static init() {
    dio.options = BaseOptions(
      // baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer 123123asfasfz1231',
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
