import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/laporan_keuangan_bulanan_controller.dart';

class LaporanKeuanganBulananView extends StatefulWidget {
  const LaporanKeuanganBulananView({Key? key}) : super(key: key);

  Widget build(context, LaporanKeuanganBulananController controller) {
    controller.view = this;
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.items.length,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          var item = controller.items[index];
          String date = DateFormat("MMMM").format(DateTime.parse(item["date"]));
          return Container(
            color: index % 2 == 0 ? Colors.grey[300] : Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    date,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    NumberFormat().format(item["pemasukan"] ?? 0),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    NumberFormat().format(item["pengeluaran"] ?? 0),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  State<LaporanKeuanganBulananView> createState() =>
      LaporanKeuanganBulananController();
}
