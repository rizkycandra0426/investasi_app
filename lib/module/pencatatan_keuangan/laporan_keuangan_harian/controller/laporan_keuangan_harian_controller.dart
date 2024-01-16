import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_month_and_year_response.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/controller/dashboard_controller.dart';
import 'package:hyper_ui/service/transaction_history_service.dart';
import '../view/laporan_keuangan_harian_view.dart';

class LaporanKeuanganHarianController extends State<LaporanKeuanganHarianView> {
  static late LaporanKeuanganHarianController instance;
  late LaporanKeuanganHarianView view;

  @override
  void initState() {
    instance = this;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    if (view.date == null) {
      var dashboardController = DashboardController.instance;
      getHistories(
        month: dashboardController.currentDate.month,
        year: dashboardController.currentDate.year,
      );
    } else {
      getHistories(
        month: view.date?.month,
        year: view.date?.year,
      );
    }
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  TransactionByMonthAndYearResponse? response;
  bool loading = true;
  getHistories({
    int? month,
    int? year,
  }) async {
    if (!mounted) return;
    loading = true;
    setState(() {});

    response = await TransactionHistoryService().byMonthAndYear(
      month: month ?? DateTime.now().month,
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
      if (item.type == "Pemasukan") {
        pemasukan += item.jumlah!;
      } else {
        pengeluaran += item.jumlah!;
      }
    }

    DashboardController.instance.balance = pemasukan - pengeluaran;
    DashboardController.instance.pemasukan = pemasukan;
    DashboardController.instance.pengeluaran = pengeluaran;
    DashboardController.instance.setState(() {});
  }
}
