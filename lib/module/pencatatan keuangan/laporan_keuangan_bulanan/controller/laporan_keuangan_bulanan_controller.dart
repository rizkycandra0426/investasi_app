import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/laporan_keuangan_bulanan_view.dart';

class LaporanKeuanganBulananController
    extends State<LaporanKeuanganBulananView> {
  static late LaporanKeuanganBulananController instance;
  late LaporanKeuanganBulananView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
