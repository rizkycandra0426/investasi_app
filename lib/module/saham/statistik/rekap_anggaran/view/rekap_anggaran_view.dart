import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/rekap_anggaran_controller.dart';

class RekapAnggaranView extends StatefulWidget {
  const RekapAnggaranView({super.key});

  Widget build(context, RekapAnggaranController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rekap Anggaran"),
        actions: const [],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.blue,
            child: Row(
              children: [
                Container(
                  width: 90.0,
                  child: Text(
                    "Bulan",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Total Pengeluaran",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Sisa Budget",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.rekapItems.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.rekapItems[index];
                var date = DateTime(now.year, item["month"], 1);

                return Container(
                  color: index % 2 == 0 ? Colors.grey[300] : Colors.white,
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        width: 90.0,
                        child: Text(
                          "${date.MMMM}",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${(item["total_pengeluaran"] as double).number}",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${(item["sisa_budget"] as double).number}",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<RekapAnggaranView> createState() => RekapAnggaranController();
}
