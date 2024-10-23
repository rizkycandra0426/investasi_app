import 'package:hyper_ui/service/base_service.dart';

class HistoriTahunanService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "histori-tahunan";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
