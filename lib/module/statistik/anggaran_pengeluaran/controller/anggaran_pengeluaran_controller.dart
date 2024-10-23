import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_categories_by_month_and_year_response.dart';

class AnggaranPengeluaranController extends State<AnggaranPengeluaranView> {
  static late AnggaranPengeluaranController instance;
  late AnggaranPengeluaranView view;

  @override
  void initState() {
    instance = this;
    super.initState();

    var dashboardController = StatistikDashboardController.instance;
    printo("initState");
    getHistories(
      month: dashboardController.currentDate.month,
      year: dashboardController.currentDate.year,
    );
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  TransactionCategoriesByYearResponse? response;
  bool loading = true;
  List items = [];
  getHistories({
    int? month,
    int? year,
  }) async {
    print("getHistories.... $month/$year");
    loading = true;
    setState(() {});

    response = await TransactionHistoryService().categoriesByMonthAndYear(
      month: month ?? DateTime.now().month,
      year: year ?? DateTime.now().year,
    );

    items = [];
    for (var item in response!.data!) {
      items.add({
        "label": item.namaKategoriPengeluaran,
        "total": item.total,
      });
    }
    loading = false;
    if (mounted) setState(() {});
  }

  double get total {
    var pengeluaranList = OfflineService.get("pengeluaran");
    double _total = 0;
    for (var item in pengeluaranList) {
      var tanggal = DateTime.parse(item['tanggal']);
      if (tanggal.month !=
          StatistikDashboardController.instance.currentDate.month) continue;
      if (tanggal.year !=
          StatistikDashboardController.instance.currentDate.year) continue;

      _total += double.parse(item['jumlah'] ?? 0);
    }
    return _total;
  }

  double get totalBudget {
    double _total = 0;
    for (var item in response!.data!) {
      var budget = getBudget(
        name: item.namaKategoriPengeluaran!,
        month:
            StatistikDashboardController.instance.currentDate.month.toString(),
        year: StatistikDashboardController.instance.currentDate.year.toString(),
      );
      if (budget == 0) continue;
      _total += budget;
    }
    return _total;
  }

  double getPengeluaranByNamaKategori(String namaKategoriPengeluaran) {
    var pengeluaranList = OfflineService.get("pengeluaran");
    double _total = 0;
    for (var item in pengeluaranList) {
      if (item['kategori_pengeluaran']['nama_kategori_pengeluaran'] !=
          namaKategoriPengeluaran) continue;
      var tanggal = DateTime.parse(item['tanggal']);
      if (tanggal.month !=
          StatistikDashboardController.instance.currentDate.month) continue;
      if (tanggal.year !=
          StatistikDashboardController.instance.currentDate.year) continue;
      _total += double.parse(item['jumlah'] ?? 0);
    }
    return _total;
  }

  double get sisa {
    return totalBudget - total;
  }

  int get selectedMonth => DashboardController.instance.currentDate.month;
}
