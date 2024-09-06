import 'package:dio/dio.dart';
import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/model/pengeluaran_response.dart';
import 'package:hyper_ui/model/stock_detail_response.dart';
import 'package:hyper_ui/service/base_service.dart';
import 'package:hyper_ui/service/db_service.dart';
import 'package:hyper_ui/service/notification_service.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';
import 'package:hyper_ui/shared/util/log/log.dart';

//TODO: Update model-nya
class BeritaService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "berita";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
