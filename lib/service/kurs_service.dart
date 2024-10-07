import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/base_service.dart';

class KursService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "kurs";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
