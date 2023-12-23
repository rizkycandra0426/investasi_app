import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/laporan_keuangan_kalender_view.dart';

class LaporanKeuanganKalenderController
    extends State<LaporanKeuanganKalenderView> {
  static late LaporanKeuanganKalenderController instance;
  late LaporanKeuanganKalenderView view;

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
