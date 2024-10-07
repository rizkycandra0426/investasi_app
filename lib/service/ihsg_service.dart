import 'package:hyper_ui/service/base_service.dart';

class IhsgService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "ihsg";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
