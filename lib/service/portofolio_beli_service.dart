import 'package:hyper_ui/service/base_service.dart';

//TODO: Update model-nya
class PortofolioBeliService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "portofoliobeli";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
