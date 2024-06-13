import 'package:dio/dio.dart';
import 'package:hyper_ui/model/pengeluaran_response.dart';
import 'package:hyper_ui/model/stock_detail_response.dart';
import 'package:hyper_ui/service/base_service.dart';

//TODO: Update model-nya
class StockService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "stock";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }

  Future<StockDetailResponse> getDetail(String symbol) async {
    var response = await Dio().get(
      "$baseUrl/stock/$symbol",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return StockDetailResponse.fromJson(response.data);
  }
}
