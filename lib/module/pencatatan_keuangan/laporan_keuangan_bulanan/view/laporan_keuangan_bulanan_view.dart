import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class LaporanKeuanganBulananView extends StatefulWidget {
  const LaporanKeuanganBulananView({Key? key}) : super(key: key);

  Widget build(context, LaporanKeuanganBulananController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    var items = controller.response!.data!;

    items = items.reversed.toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          var item = items[index];
          String date = item.month!;
          return InkWell(
            onTap: () {
              controller.getHistories();
            },
            child: Container(
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
                      NumberFormat().format(item.totalPemasukan ?? 0),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      NumberFormat().format(item.totalPengeluaran ?? 0),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
