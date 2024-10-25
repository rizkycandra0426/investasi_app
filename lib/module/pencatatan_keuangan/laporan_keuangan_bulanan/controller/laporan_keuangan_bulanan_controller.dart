import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_year_response.dart';

class LaporanKeuanganBulananController
    extends State<LaporanKeuanganBulananView> {
  static late LaporanKeuanganBulananController instance;
  late LaporanKeuanganBulananView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getHistories();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  TransactionByYearResponse? response;
  bool loading = true;

  getHistories({
    int? year,
  }) async {
    print("getHistories...");
    if (!mounted) return;
    loading = true;
    setState(() {});

    response = await TransactionHistoryService().byYear(
      year: DashboardController.instance.currentDate.year,
    );
    calculateTotal();

    loading = false;
    setState(() {});
    print("getHistories Done...");
  }

  calculateTotal() {
    double pemasukan = 0;
    double pengeluaran = 0;
    for (var item in response!.data!) {
      pemasukan += item.totalPemasukan!;
      pengeluaran += item.totalPengeluaran!;
    }

    DashboardController.instance.balance = pemasukan - pengeluaran;
    DashboardController.instance.pemasukan = pemasukan;
    DashboardController.instance.pengeluaran = pengeluaran;
    DashboardController.instance.setState(() {});
  }
}
