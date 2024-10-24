import 'package:hyper_ui/service/base_service.dart';

class BeritaService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "berita";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
