import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/laporan_keuangan_harian_form_view.dart';

class LaporanKeuanganHarianFormController
    extends State<LaporanKeuanganHarianFormView> {
  static late LaporanKeuanganHarianFormController instance;
  late LaporanKeuanganHarianFormView view;

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
