import 'package:dio/dio.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/service/auth_service.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';

class OfflineService {
  static Map<String, List> localValues = {};

  static List keys = [
    "kategori-pemasukan",
    "kategori-pengeluaran",
    "pemasukan",
    "pengeluaran",
    "berita"
  ];

  static List get(String key) {
    return OfflineService.localValues["$key"]!;
  }

  static Future loadLocalValues() async {
    if (token == null) return;

    for (var key in keys) {
      localValues["$key"] = await DBService.loadList("$key");
    }

    //Get updates from servers
    for (var key in keys) {
      try {
        var response = await dio.get(
          "/offline/$key",
        );
        Map obj = response.data;
        List values = obj["data"];
        localValues["$key"] = values;
      } on Exception catch (err) {
        print(err);
      }
    }
  }

  static Future saveLocalValues() async {
    if (token == null) return;

    for (var key in keys) {
      await DBService.saveList("$key", localValues[key]!);
    }
  }

  static Future saveLocalValuesAndUpdateToServer() async {
    if (token == null) return;

    await saveLocalValues();
    for (var key in keys) {
      try {
        dio.post(
          "/offline/$key",
        );
      } on Exception catch (err) {
        print(err);
      }
    }
  }
}
