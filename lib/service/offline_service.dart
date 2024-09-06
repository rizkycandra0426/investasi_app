import 'dart:developer';

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
    "berita",
  ];

  static List get(String key) {
    if (OfflineService.localValues["$key"] == null) return [];
    return OfflineService.localValues["$key"]!
        // .where((i) => i["action"] != "delete")
        .toList();
  }

  static cacheCategoriesFromApi() async {
    try {
      var response = await dio.get(
        "/kategori-pemasukan",
      );
      Map obj = response.data;
      List values = obj["data"];
      localValues["kategori-pemasukan"] = values;
    } on Exception catch (err) {
      print(err);
    }

    try {
      var response = await dio.get(
        "/kategori-pengeluaran",
      );
      Map obj = response.data;
      List values = obj["data"];
      localValues["kategori-pengeluaran"] = values;
    } on Exception catch (err) {
      print(err);
    }
  }

  static void add(String key, Map<String, dynamic> value) {
    var currentValues = OfflineService.localValues["$key"]!;
    currentValues.add(value);
  }

  static void update(
      String key, String idKey, int id, Map<String, dynamic> value) {
    print(value);
    var currentValueIndex = OfflineService.localValues["$key"]!
        .indexWhere((i) => i["$idKey"] == id);
    var keyList = value.keys.toList();
    for (var index = 0; index < keyList.length; index++) {
      var fieldKey = keyList[index];
      OfflineService.localValues[key]![currentValueIndex][fieldKey] =
          value[fieldKey];
    }
  }

  static void delete(String key, String idKey, int id) {
    var currentValueIndex = OfflineService.localValues["$key"]!
        .indexWhere((i) => i["$idKey"] == id);

    var current = OfflineService.localValues[key]![currentValueIndex];
    printo(current);

    current["synced"] = false;
    current["action"] = "delete";

    printg(current);
    printg("----");
    OfflineService.localValues[key]![currentValueIndex] = current;
  }

  static void deletePermanently(String key, String idKey, int id) {
    var currentValueIndex = OfflineService.localValues["$key"]!
        .indexWhere((i) => i["$idKey"] == id);
    OfflineService.localValues[key]!.removeAt(currentValueIndex);
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
        //Use current local values if get updates error!
        localValues["$key"] = await DBService.loadList("$key");
        print(err);
      }
    }

    //### Independent sync
    StockNewService.stocks = await DBService.loadList("stocks");
    StockNewService.tradeHistories = await DBService.loadList("tradeHistories");
    UserBalanceService.topupHistories =
        await DBService.loadList("topupHistories");
    StockNewService.ihsgStart =
        double.tryParse("${DBService.get("ihsg_start") ?? 0}") ?? 0;
    StockNewService.ihsgEnd =
        double.tryParse("${DBService.get("ihsg_end") ?? 0}") ?? 0;
    //### END
  }

  static Future saveLocalValues() async {
    if (token == null) return;

    for (var key in keys) {
      await DBService.saveList("$key", localValues[key]!);
    }

    //### Independent sync
    //Clean values
    await DBService.saveList("stocks", StockNewService.cleanStocks);
    await DBService.saveList("tradeHistories", StockNewService.tradeHistories);
    await DBService.saveList(
        "topupHistories", UserBalanceService.topupHistories);
    await DBService.set("ihsg_start", StockNewService.ihsgStart.toString());
    await DBService.set("ihsg_end", StockNewService.ihsgEnd.toString());
    //### END
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

  //upload pemasukan dan pengeluaran
  static Future syncPemasukanDanPengeluaranToServer() async {
    var pemasukan = OfflineService.get("pemasukan");
    var unsyncedPemasukan =
        pemasukan.where((i) => i["synced"] == false).toList();

    var pengeluaran = OfflineService.get("pengeluaran");
    var unsyncedPengeluaran = pengeluaran
        .where(
          (i) => i["synced"] == false,
        )
        .toList();

    bool thereIsDeletedItem = false;
    for (var item in unsyncedPemasukan) {
      try {
        print(item);
        if (item["action"] == "delete") {
          thereIsDeletedItem = true;
          await PemasukanService().delete(item["id_pemasukan"]);
          OfflineService.deletePermanently(
              "pemasukan", "id_pemasukan", item["id_pemasukan"]);
        }

        if (item["action"] == "create") {
          await PemasukanService().create({
            "id_pemasukan": item["id_pemasukan"],
            "tanggal": DateTime.parse(item["tanggal"]).yMd,
            "jumlah": double.parse("${item["jumlah"]}").floor(),
            "catatan": item["catatan"],
            "id_kategori_pemasukan": item["id_kategori_pemasukan"],
          });
          item["synced"] = true;
          item["action"] = null;
        }

        if (item["action"] == "update") {
          await PemasukanService().update(item["id_pemasukan"], {
            "tanggal": DateTime.parse(item["tanggal"]).yMd,
            "jumlah": double.parse("${item["jumlah"]}").floor(),
            "catatan": item["catatan"],
            "id_kategori_pemasukan": item["id_kategori_pemasukan"],
          });
          item["synced"] = true;
          item["action"] = null;
        }
      } on Exception catch (err) {
        item["synced"] = false;
        print(err);
      }
    }

    for (var item in unsyncedPengeluaran) {
      try {
        if (item["action"] == "delete") {
          thereIsDeletedItem = true;
          await PengeluaranService().delete(item["id_pengeluaran"]);
          OfflineService.deletePermanently(
              "pengeluaran", "id_pengeluaran", item["id_pengeluaran"]);
        }
        if (item["action"] == "create") {
          await PengeluaranService().create({
            "id_pengeluaran": item["id_pengeluaran"],
            "tanggal": DateTime.parse(item["tanggal"]).yMd,
            "jumlah": double.parse("${item["jumlah"]}").floor(),
            "catatan": item["catatan"],
            "id_kategori_pengeluaran": item["id_kategori_pengeluaran"],
          });
          item["synced"] = true;
          item["action"] = null;
        }
        if (item["action"] == "update") {
          await PengeluaranService().update(item["id_pengeluaran"], {
            "tanggal": DateTime.parse(item["tanggal"]).yMd,
            "jumlah": double.parse("${item["jumlah"]}").floor(),
            "catatan": item["catatan"],
            "id_kategori_pengeluaran": item["id_kategori_pengeluaran"],
          });
          item["synced"] = true;
          item["action"] = null;
        }
      } on Exception catch (err) {
        item["synced"] = false;
        print(err);
      }
    }

    if (thereIsDeletedItem) {
      DashboardController.instance.reload();
    }
  }
}
