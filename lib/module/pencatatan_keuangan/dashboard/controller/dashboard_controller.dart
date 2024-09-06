import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_bulanan/controller/laporan_keuangan_bulanan_controller.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_harian/controller/laporan_keuangan_harian_controller.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_kalender/controller/laporan_keuangan_kalender_controller.dart';
import 'package:hyper_ui/service/offline_service.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;

  var floatingReturn;
  var portoYield;

  Timer? timer;
  @override
  void initState() {
    instance = this;
    super.initState();
    OfflineService.syncPemasukanDanPengeluaranToServer();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int counter = 0;
  next() {
    if (!mounted) return;
    counter++;
    setState(() {});
  }

  prev() {
    if (!mounted) return;
    counter--;
    setState(() {});
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

  int selectedIndex = 0;
  updateSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
  }

  String randomUid = Uuid().v4();
  reload() {
    randomUid = Uuid().v4();
    setState(() {});
  }
}
