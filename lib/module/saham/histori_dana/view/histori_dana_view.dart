import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hyper_ui/core.dart';
import '../controller/histori_dana_controller.dart';

class HistoriDanaView extends StatefulWidget {
  final bool depositoMode;
  HistoriDanaView({
    Key? key,
    required this.depositoMode,
  }) : super(key: key);

  Widget build(context, HistoriDanaController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histori ${depositoMode ? "Deposito" : "Dana"}",
        ),
        actions: [],
      ),
      bottomNavigationBar: depositoMode
          ? QActionButton(
              color: Colors.blue,
              label: "Buy Deposito",
              onPressed: () => Get.to(BuyDepositoView()),
            )
          : QActionButton(
              color: Colors.blue,
              label: "Balance: ${TRX.getSaldoTerakhir().number}",
              onPressed: () {},
            ),
      body: Builder(builder: (context) {
        return Column(
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      depositoMode ? "Bank" : "Date",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      depositoMode ? "Deposito" : "Amount",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (!depositoMode) ...[
                    Expanded(
                      child: Text(
                        "Harga Unit",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Jumlah Unit",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  if (depositoMode) ...[
                    Expanded(
                      child: Text(
                        "Deviden",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Jumlah Deviden",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: TRX.danaHistories.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = TRX.danaHistories[index];

                  var action = "TOPUP";

                  if (depositoMode) {
                    if (item.target.contains("DEPOSITO") == false)
                      return Container();
                  } else {
                    if (item.target == "DEVIDENSAHAM") return Container();
                    if (item.target == "DEVIDENDEPOSITO") return Container();
                    if (item.target == "BUYDEPOSITO") return Container();
                  }

                  if (depositoMode) {
                    var lastIndex = TRX.danaHistories
                        .lastIndexWhere((dd) => dd.namaBank == item.namaBank);
                    if (index != lastIndex) return Container();
                  }

                  if (item.price < 0) {
                    action = "WITHDRAW";
                  }

                  if (item.target == "DEVIDENSAHAM") {
                    action = "TOPUP DEVIDEN SAHAM";
                  }
                  if (item.target == "DEVIDENDEPOSITO") {
                    action = "TOPUP DEVIDEN DEPOSITO";
                  }

                  var deviden = 0;
                  var jumlahDeviden = 0;

                  var itemValues = [
                    if (!depositoMode) ...[
                      {
                        "label": "Date",
                        "value": item.date.dMMMy,
                      },
                      {
                        "label": "Amount",
                        "value": item.total.number,
                      },
                    ],
                    if (depositoMode) ...[
                      {
                        "label": "Bank",
                        "value": item.namaBank ?? '-',
                      },
                      {
                        "label": "Deposito",
                        "value": TRX
                            .getAllAmountTotalByNamaBank(item.namaBank)
                            .number,
                      },
                    ],
                    if (!depositoMode) ...[
                      {
                        "label": "Harga Unit",
                        "value": item.hargaUnit.number,
                      },
                      {
                        "label": "Jumlah Unit",
                        "value": item.jumlahUnit.number,
                      },
                    ],
                    if (depositoMode) ...[
                      {
                        "label": "Deviden",
                        "value": item.target == "BUYDEPOSITO"
                            ? TRX
                                .getLastDevidenRecordByNamaSaham(item.namaBank)
                                .number
                            : item.deviden.number,
                      },
                      {
                        "label": "Jumlah Deviden",
                        "value": item.jumlahDeviden.number,
                      },
                    ],
                  ];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      color:
                          index % 2 == 0 ? Colors.grey[100] : Colors.grey[200],
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          itemValues.length,
                          (valueIndex) {
                            var value = itemValues[valueIndex];
                            return Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    //Header
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
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  State<HistoriDanaView> createState() => HistoriDanaController();
}
