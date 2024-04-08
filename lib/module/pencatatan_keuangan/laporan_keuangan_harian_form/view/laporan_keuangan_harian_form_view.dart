import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_month_and_year_response.dart';
import '../controller/laporan_keuangan_harian_form_controller.dart';

class LaporanKeuanganHarianFormView extends StatefulWidget {
  final HistoryHarian item;
  const LaporanKeuanganHarianFormView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, LaporanKeuanganHarianFormController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("LaporanKeuanganHarianForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<LaporanKeuanganHarianFormView> createState() =>
      LaporanKeuanganHarianFormController();
}
