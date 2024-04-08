import 'package:hyper_ui/model/kategori_pemasukan_response.dart';
import 'package:hyper_ui/service/base_service.dart';
import 'package:hyper_ui/service/pemasukan_service.dart';

class KategoriPemasukanService extends BaseService<KategoriPemasukanResponse> {
  @override
  String get endpoint => "kategori_pemasukans";

  @override
  KategoriPemasukanResponse decode(data) {
    return KategoriPemasukanResponse.fromJson(data);
  }
}
