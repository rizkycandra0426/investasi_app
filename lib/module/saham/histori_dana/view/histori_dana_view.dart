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
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              itemBuilder: (context, yearIndex) {
                var itemYear = now.year + yearIndex;

                var histories = UserBalanceService.topupHistories
                    .where((element) =>
                        DateTime.parse(element["date"]).year == itemYear)
                    .toList();

//Sumlah jumlah dari kolom jumlah di histories
                var totalJumlah = 0.0;
                for (var history in histories) {
                  totalJumlah +=
                      double.tryParse(history["amount"].toString()) ?? 0;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "$itemYear",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: histories.length,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = histories[index];
                        var date = DateTime.parse(item["date"]).dMMMy;

                        return Container(
                          color: index % 2 == 0
                              ? Colors.grey[200]
                              : Colors.grey[300],
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
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${totalJumlah.number}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<HistoriDanaView> createState() => HistoriDanaController();
}
