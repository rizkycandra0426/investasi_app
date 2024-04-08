import 'package:hyper_ui/model/pemasukan_response.dart';
import 'package:hyper_ui/service/base_service.dart';

class PemasukanService extends BaseService<PemasukanResponse> {
  @override
  String get endpoint => "pemasukans";

  @override
  PemasukanResponse decode(data) {
    return PemasukanResponse.fromJson(data);
  }
}
