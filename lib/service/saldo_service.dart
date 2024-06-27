import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/pengeluaran_response.dart';
import 'package:hyper_ui/service/base_service.dart';

double currentUserSaldo = 0.0;

class SaldoService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "saldo";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }

  Future<double> getSaldoUser() async {
    var url = "$baseUrl/$endpoint/user";
    var response = await dio.post(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    currentUserSaldo = double.tryParse("${response.data["saldo"]}") ?? 0.0;
    print("SALDO: $currentUserSaldo");
    return currentUserSaldo;
  }
}
