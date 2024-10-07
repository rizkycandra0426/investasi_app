import 'package:dio/dio.dart';
import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/model/stock_detail_response.dart';
import 'package:hyper_ui/service/base_service.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';

//TODO: Update model-nya
class StockService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "stock";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }

  Future<StockDetailResponse> getDetail(String symbol) async {
    var response = await dio.get(
      "$baseUrl/stock/$symbol",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          'ngrok-skip-browser-warning': true,
        },
      ),
    );
    return StockDetailResponse.fromJson(response.data);
  }
}
