import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        actions: [],
      ),
      body: Builder(builder: (context) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 12.0,
          ),
          itemCount: TRX.danaHistories.length,
          itemBuilder: (BuildContext context, int index) {
            var item = TRX.danaHistories[index];

            var action = "TOPUP";
            if (item.price < 0) {
              action = "WITHDRAW";
            }

            if (item.target == "DEVIDENSAHAM") {
              action = "TOPUP DEVIDEN SAHAM";
            }
            if (item.target == "DEVIDENDEPOSITO") {
              action = "TOPUP DEVIDEN DEPOSITO";
            }

            var itemValues = [
              {
                "label": "Date",
                "value": item.date.yMd,
              },
              {
                "label": "Target",
                "value": action,
              },
              {
                "label": "Amount",
                "value": item.total.number,
              },
            ];
            return InkWell(
              onTap: () {},
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StaggeredGrid.count(
                        crossAxisCount: 3,
                        children: List.generate(
                          itemValues.length,
                          (index) {
                            var value = itemValues[index];
                            return StaggeredGridTile.fit(
                              crossAxisCellCount: 1,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  bottom: 12.0,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "${value["label"]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    Text(
                                      "${value["value"]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: QActionButton(
        color: Colors.black,
        label: "Balance: ${TRX.getSaldoTerakhir().number}",
        onPressed: () {},
      ),
    );
  }

  @override
  State<HistoriDanaView> createState() => HistoriDanaController();
}
