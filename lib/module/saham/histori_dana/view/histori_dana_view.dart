import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/histori_dana_controller.dart';

class HistoriDanaView extends StatefulWidget {
  HistoriDanaView({Key? key}) : super(key: key);

  Widget build(context, HistoriDanaController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histori Dana ${now.year}",
        ),
        actions: [],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.items.length,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.items[index];
                return Container(
                  color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[300],
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${item["bulan"]}",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${double.tryParse(item["saldo"].toString()).currency}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Harga Unit",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item["saldo"] == 0
                                  ? "0".currency
                                  : "${controller.hargaUnit.currency}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Jumlah Unit",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item["saldo"] == 0
                                  ? "0".currency
                                  : "${(double.tryParse(item["saldo"].toString())! / controller.hargaUnit).currency}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[900],
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "${controller.total.currency}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  State<HistoriDanaView> createState() => HistoriDanaController();
}
