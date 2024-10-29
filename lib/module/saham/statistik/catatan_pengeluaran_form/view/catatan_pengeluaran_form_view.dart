import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/catatan_pengeluaran_form_controller.dart';

class CatatanPengeluaranFormView extends StatefulWidget {
  const CatatanPengeluaranFormView({super.key});

  Widget build(context, CatatanPengeluaranFormController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatan Pengeluaran Form"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<CatatanPengeluaranFormView> createState() =>
      CatatanPengeluaranFormController();
}
