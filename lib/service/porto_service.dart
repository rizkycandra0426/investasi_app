import 'package:dio/dio.dart';
import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/model/pengeluaran_response.dart';
import 'package:hyper_ui/model/stock_detail_response.dart';
import 'package:hyper_ui/service/base_service.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';

class PortoService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "porto";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
