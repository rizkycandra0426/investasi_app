import 'package:hyper_ui/service/base_service.dart';

class CategoryRequestService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "category-requests";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
