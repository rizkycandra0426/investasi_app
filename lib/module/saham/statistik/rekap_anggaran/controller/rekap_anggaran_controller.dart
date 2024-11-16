import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_categories_by_month_and_year_response.dart';
import '../view/rekap_anggaran_view.dart';

class RekapAnggaranController extends State<RekapAnggaranView> {
  static late RekapAnggaranController instance;
  late RekapAnggaranView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    getData();
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  TransactionCategoriesByYearResponse? response;
  bool loading = true;
  List rekapItems = [];
  getData() async {
    loading = true;
    setState(() {});

    for (var i = 1; i <= 12; i++) {
      var res = await getHistories(
        month: i,
        year: DateTime.now().year,
      );
      rekapItems.add(res);
    }

    loading = false;
    setState(() {});
  }

  Future<Map> getHistories({
    required int month,
    required int year,
  }) async {
    print("getHistories.... $month/$year");

    response = await TransactionHistoryService().categoriesByMonthAndYear(
      month: month,
      year: year,
    );

    List items = [];
    for (var item in response!.data!) {
      items.add({
        "label": item.namaKategoriPengeluaran,
        "total": item.total,
      });
    }

    double totalBudget = 0;
    for (var item in response!.data!) {
      var budget = getBudget(
        name: item.namaKategoriPengeluaran!,
        month: month.toString(),
        year: year.toString(),
      );
      if (budget == 0) continue;
      totalBudget += budget;
    }

    //----------------------------------
    var pengeluaranList = OfflineService.get("pengeluaran");
    double totalPengeluaran = 0;
    for (var item in pengeluaranList) {
      var tanggal = DateTime.parse(item['tanggal']);
      if (tanggal.month != month) continue;
      if (tanggal.year != year) continue;

      totalPengeluaran += double.parse(item['jumlah'] ?? 0);
    }
    //----------------------------------

    double sisaBudget = totalBudget - totalPengeluaran;

    return {
      "month": month,
      "year": year,
      "total_pengeluaran": totalPengeluaran,
      "total_budget": totalBudget,
      "sisa_budget": sisaBudget,
    };
  }
}
