import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_year_response.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/controller/dashboard_controller.dart';
import 'package:hyper_ui/service/transaction_history_service.dart';
import '../view/laporan_keuangan_bulanan_view.dart';

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
    if (!mounted) return;
    if (!mounted) return;
    loading = true;
    setState(() {});

    response = await TransactionHistoryService().byYear(
      year: year ?? DateTime.now().year,
    );
    calculateTotal();

    loading = false;
    setState(() {});
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
