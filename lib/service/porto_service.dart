import 'package:hyper_ui/service/base_service.dart';

class PortoService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "porto";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
