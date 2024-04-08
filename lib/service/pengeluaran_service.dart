import 'package:hyper_ui/model/pengeluaran_response.dart';
import 'package:hyper_ui/service/base_service.dart';

class PengeluaranService extends BaseService<PengeluaranResponse> {
  @override
  String get endpoint => "pengeluarans";

  @override
  PengeluaranResponse decode(data) {
    return PengeluaranResponse.fromJson(data);
  }
}
