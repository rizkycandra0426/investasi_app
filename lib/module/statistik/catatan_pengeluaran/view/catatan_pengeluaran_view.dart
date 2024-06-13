import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/widget/loading/loading_scaffold.dart';
import '../controller/catatan_pengeluaran_controller.dart';

class CatatanPengeluaranView extends StatefulWidget {
  CatatanPengeluaranView({Key? key}) : super(key: key);

  Widget build(context, CatatanPengeluaranController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    var items = controller.response!.data!
        .where((i) => i.type == "Pengeluaran")
        .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Catatan",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Divider(),
              ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = items[index];
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                width: 80,
                                child: Text(
                                  "${item.catatan}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 80,
                              child: Text(
                                "${NumberFormat().format(item.jumlah!)}",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: warningColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              // ... widget lainnya
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CatatanPengeluaranView> createState() => CatatanPengeluaranController();
}
