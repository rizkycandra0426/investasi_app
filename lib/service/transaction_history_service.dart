import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_month_and_year_response.dart';
import 'package:hyper_ui/model/transaction_by_year_response.dart';
import 'package:hyper_ui/model/transaction_categories_by_month_and_year_response.dart';

class TransactionHistoryService extends BaseService {
  Future<TransactionByMonthAndYearResponse> byMonthAndYear({
    required int month,
    required int year,
  }) async {
    // var response = await dio.get(
    //   "$baseUrl/transaction-histories/$month/$year",
    //   options: Options(
    //     headers: {
    //       "Content-Type": "application/json",
    //       'ngrok-skip-browser-warning': true,
    //     },
    //   ),
    // );

    Map<String, dynamic> data = {};
    var pemasukanList = OfflineService.get("pemasukan");
    var pengeluaranList = OfflineService.get("pengeluaran");

    List values = [];

    var filteredPemasukanList = pemasukanList.where((i) =>
        DateTime.parse(i["created_at"]).month == month &&
        DateTime.parse(i["created_at"]).year == year);

    var filteredPengeluaranList = pengeluaranList.where((i) =>
        DateTime.parse(i["created_at"]).month == month &&
        DateTime.parse(i["created_at"]).year == year);

    for (var item in filteredPemasukanList) {
      values.add({
        "id": item['id_pemasukan'],
        "user_id": item['user_id'],
        "tanggal": item['tanggal'],
        "jumlah": int.parse(item['jumlah'].toString()),
        "catatan": item['catatan'],
        "id_kategori": item['id_kategori_pemasukan'],
        "nama_kategori": item['kategori_pemasukan']['nama_kategori_pemasukan'],
        "nama_kategori_pemasukan": item['nama_kategori_pemasukan'],
        "created_at": item['created_at'],
        "updated_at": item['updated_at'],
        "type": "Pemasukan"
      });
    }

    for (var item in filteredPengeluaranList) {
      values.add({
        "id": item['id_pengeluaran'],
        "user_id": item['user_id'],
        "tanggal": item['tanggal'],
        "jumlah": int.tryParse(item['jumlah'].toString()) ?? 0,
        "catatan": item['catatan'],
        "id_kategori": item['id_kategori_pengeluaran'],
        "nama_kategori": item['kategori_pengeluaran']
            ['nama_kategori_pengeluaran'],
        "nama_kategori_pemasukan": item['nama_kategori_pengeluaran'],
        "kategori_pengeluaran": item['kategori_pengeluaran'],
        "created_at": item['created_at'],
        "updated_at": item['updated_at'],
        "type": "Pengeluaran"
      });
    }

    //Sort values by created_at DESC?
    values.sort((a, b) {
      return DateTime.parse(b['created_at'])
          .compareTo(DateTime.parse(a['created_at']));
    });

    return TransactionByMonthAndYearResponse.fromJson({
      "data": values,
    });
  }

  Future<TransactionByYearResponse> byYear({
    required int year,
  }) async {
    // var response = await dio.get(
    //   "$baseUrl/transaction-histories/$year",
    //   options: Options(
    //     headers: {
    //       "Content-Type": "application/json",
    //       'ngrok-skip-browser-warning': true,
    //     },
    //   ),
    // );

    Map<String, dynamic> data = {};
    var pemasukanList = OfflineService.get("pemasukan");
    var pengeluaranList = OfflineService.get("pengeluaran");

    List values = [];

    var filteredPemasukanList = pemasukanList
        .where((i) => DateTime.parse(i["created_at"]).year == year);

    var filteredPengeluaranList = pengeluaranList
        .where((i) => DateTime.parse(i["created_at"]).year == year);

    for (var i = 1; i <= 12; i++) {
      var totalPemasukan = 0;
      for (var item in filteredPemasukanList) {
        if (DateTime.parse(item['created_at']).month != i) continue;
        totalPemasukan += int.parse(item['jumlah'].toString());
      }

      var totalPengeluaran = 0;
      for (var item in filteredPengeluaranList) {
        if (DateTime.parse(item['created_at']).month != i) continue;
        totalPengeluaran += int.parse(item['jumlah'].toString());
      }

      values.add({
        "month": DateTime(year, i, 1).MMMM,
        "total_pemasukan": totalPemasukan,
        "total_pengeluaran": totalPengeluaran,
      });
    }

    return TransactionByYearResponse.fromJson({
      "data": values,
    });
  }

  Future<TransactionCategoriesByYearResponse> categoriesByMonthAndYear({
    required int month,
    required int year,
  }) async {
    // var response = await dio.get(
    //   "$baseUrl/transaction-histories/categories/$month/$year",
    //   options: Options(
    //     headers: {
    //       "Content-Type": "application/json",
    //       'ngrok-skip-browser-warning': true,
    //     },
    //   ),
    // );
    // return TransactionCategoriesByYearResponse.fromJson(response.data);

    Map<String, dynamic> data = {};
    var pemasukanList = OfflineService.get("pemasukan");
    var pengeluaranList = OfflineService.get("pengeluaran");

    List values = [];

    var filteredPemasukanList = pemasukanList.where((i) =>
        DateTime.parse(i["created_at"]).month == month &&
        DateTime.parse(i["created_at"]).year == year);

    var filteredPengeluaranList = pengeluaranList.where((i) =>
        DateTime.parse(i["created_at"]).month == month &&
        DateTime.parse(i["created_at"]).year == year);

    List kategoriPengeluaran = OfflineService.get("kategori-pengeluaran");

    printo(filteredPengeluaranList);

    for (var item in kategoriPengeluaran) {
      var namaKategoriPengeluaran = item["nama_kategori_pengeluaran"];

      /// Fixed
      var pengeluaranListByCategoryId = filteredPengeluaranList.where((i) =>
          i["id_kategori_pengeluaran"] == item["id_kategori_pengeluaran"]);

      var total = 0;
      for (var pengeluaran in pengeluaranListByCategoryId) {
        total += int.parse(pengeluaran["jumlah"].toString());
      }

      values.add({
        "nama_kategori_pengeluaran": namaKategoriPengeluaran,
        "total": total,
      });
    }

    //Sort values by created_at DESC?
    // values.sort((a, b) {
    //   return DateTime.parse(b['created_at'])
    //       .compareTo(DateTime.parse(a['created_at']));
    // });

    return TransactionCategoriesByYearResponse.fromJson({
      "data": values,
    });
  }
}
