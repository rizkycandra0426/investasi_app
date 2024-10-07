import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/service/base_service.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';

class PortofolioJualService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "portofoliojual";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }

  Future<int> getSisaVolume(idSaham) async {
    var response = await dio.get(
      "$baseUrl/$endpoint/action/sisa-volume/$idSaham",
    );
    Map obj = response.data;
    return obj["sisa_volume"];
  }
}
