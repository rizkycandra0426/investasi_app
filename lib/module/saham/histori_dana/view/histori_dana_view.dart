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
          Container(
            color: Colors.grey[600],
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Bulan",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Jumlah",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Harga unit",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Jumlah unit",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.items.length,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.items[index];
                var month = item["bulan"];
                double hargaUnit = controller.getHargaUnit(item["bulan"]);
                if (item["saldo"] == 0) {
                  hargaUnit = 0;
                }

                if (DateFormat("MMMM").format(now) == month) {
                  month = "NOW";
                  hargaUnit =
                      PortofolioController.instance.porto["harga_unit"] * 1.0;
                }

                return Container(
                  color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[300],
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${month}",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${double.tryParse(item["saldo"].toString()).number}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${hargaUnit == 0 ? 0 : hargaUnit.number}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              hargaUnit == 0 || item["saldo"] == 0
                                  ? "0".number
                                  : "${(double.tryParse(item["saldo"].toString())! / hargaUnit).number}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12.0,
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
                    "${controller.total.number}",
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
