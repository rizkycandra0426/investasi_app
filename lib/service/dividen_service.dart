import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/pengeluaran_response.dart';
import 'package:hyper_ui/service/base_service.dart';

class DividenService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "dividen";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
