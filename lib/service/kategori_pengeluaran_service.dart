import 'package:hyper_ui/model/kategori_pengeluaran_resposne.dart';
import 'package:hyper_ui/service/base_service.dart';

class KategoriPengeluaranService
    extends BaseService<KategoriPengeluaranResponse> {
  @override
  String get endpoint => "kategori_pengeluarans";

  @override
  KategoriPengeluaranResponse decode(data) {
    return KategoriPengeluaranResponse.fromJson(data);
  }
}
