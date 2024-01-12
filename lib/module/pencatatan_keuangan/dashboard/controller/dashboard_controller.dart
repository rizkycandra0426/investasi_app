import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_bulanan/controller/laporan_keuangan_bulanan_controller.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_harian/controller/laporan_keuangan_harian_controller.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_kalender/controller/laporan_keuangan_kalender_controller.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int counter = 0;
  next() {
    counter++;
    setState(() {});

    //reload data harian
    LaporanKeuanganHarianController.instance.getHistories(
      month: currentDate.month,
      year: currentDate.year,
    );
    LaporanKeuanganBulananController.instance.getHistories(
      year: currentDate.year,
    );
    LaporanKeuanganKalenderController.instance.getHistories(
      month: currentDate.month,
      year: currentDate.year,
    );
    StatistikPengeluaranController.instance.getHistories(
      month: currentDate.month,
      year: currentDate.year,
    );
  }

  prev() {
    counter--;
    setState(() {});

    //reload data harian
    LaporanKeuanganHarianController.instance.getHistories(
      month: currentDate.month,
      year: currentDate.year,
    );
    LaporanKeuanganBulananController.instance.getHistories(
      year: currentDate.year,
    );
    LaporanKeuanganKalenderController.instance.getHistories(
      month: currentDate.month,
      year: currentDate.year,
    );
    StatistikPengeluaranController.instance.getHistories(
      month: currentDate.month,
      year: currentDate.year,
    );
    print("OK");
    print("OK");
  }

  DateTime get currentDate {
    DateTime now = DateTime.now();
    return DateTime(now.year, (now.month + counter));
  }

  String get currentDateFormatted {
    DateTime now = DateTime.now();
    var datef = DateFormat("MMMM y").format(
      DateTime(now.year, (now.month + counter)),
    );
    return datef;
  }

  double balance = 0;
  double pemasukan = 0;
  double pengeluaran = 0;
}
