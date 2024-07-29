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
          "Histori Dana",
        ),
        actions: [
          IconButton(
            onPressed: () {
              UserBalanceService.topupHistories = [];
              StockNewService.initialize();
              controller.reload();
            },
            icon: const Icon(
              Icons.delete_forever,
              size: 24.0,
            ),
          ),
        ],
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
                        "Tanggal",
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
              itemCount: UserBalanceService.topupHistories.length,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = UserBalanceService.topupHistories[index];
                var date = DateTime.parse(item["date"]).dMMMy;

                return Container(
                  color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[300],
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${date}",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${double.tryParse(item["amount"].toString()).number}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${(item["harga_unit"] * 1.0 as double).number}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${(item["jumlah_unit"] * 1.0 as double).number}",
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
                    "${UserBalanceService.saldo.number}",
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
