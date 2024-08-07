import 'package:dio/dio.dart';
import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/model/pengeluaran_response.dart';
import 'package:hyper_ui/model/stock_detail_response.dart';
import 'package:hyper_ui/service/base_service.dart';
import 'package:hyper_ui/service/db_service.dart';
import 'package:hyper_ui/service/notification_service.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';
import 'package:hyper_ui/shared/util/log/log.dart';

//TODO: Update model-nya
class BeritaService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "berita";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }

  checkBeritaBaru() async {
    try {
      var response = await BeritaService().get();
      List items = response["data"];
      int lastIdBerita = items.first["id_berita"];

      print("id berita db ${DBService.get("id_berita")}");
      print("last id berita ${lastIdBerita}");

      //Utk test jika tidak ada berita baru
      // DBService.clear("id_berita");

      if (DBService.get("id_berita") == lastIdBerita.toString()) {
        //Tidak ada berita baru
        printr("Tidak ada berita baru");
      } else {
        //Ada berita baru
        await NotificationService().sendNotification(
          "Ada berita baru, yuk kita cek!",
          "Ada berita baru, yuk kita cek!",
        );
      }
    } on Exception catch (err) {
      print(err);
    }
  }
}
