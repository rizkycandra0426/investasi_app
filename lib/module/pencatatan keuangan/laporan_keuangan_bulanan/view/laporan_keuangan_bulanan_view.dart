import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/laporan_keuangan_bulanan_controller.dart';

class LaporanKeuanganBulananView extends StatefulWidget {
  const LaporanKeuanganBulananView({Key? key}) : super(key: key);

  Widget build(context, LaporanKeuanganBulananController controller) {
    controller.view = this;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Desember",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "250.000",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "75.000",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "November",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text("250.000",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      )),
                  Text(
                    "75.000",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LaporanKeuanganBulananView> createState() =>
      LaporanKeuanganBulananController();
}
