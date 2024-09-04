// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/trx.dart';
import 'package:hyper_ui/shared/widget/extra/topbar.dart';

class DemoSahamView extends StatefulWidget {
  DemoSahamView({Key? key}) : super(key: key);

  @override
  State<DemoSahamView> createState() => _DemoSahamViewState();
}

class _DemoSahamViewState extends State<DemoSahamView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          TopBar(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  TRX.generateOneTrade();
                  setState(() {});
                },
                icon: Icon(
                  Icons.add,
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  TRX.generateDummies();
                  setState(() {});
                },
                icon: Icon(
                  Icons.refresh,
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: ValueListenableBuilder(
                valueListenable: TRX.historyList,
                builder: (context, child, value) {
                  return LayoutBuilder(
                      builder: (context, BoxConstraints constraints) {
                    bool isTablet = MediaQuery.of(context).size.width < 1100 &&
                        MediaQuery.of(context).size.width >= 850;
                    bool isDesktop = MediaQuery.of(context).size.width >= 1100;
                    bool isMobile = MediaQuery.of(context).size.width < 850;

                    if (isMobile) {
                      return ListView.builder(
                        itemCount: TRX.historyList.value.length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var item = TRX.historyList.value[index];

                          getWidget(String? label, dynamic value) {
                            return Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  if (label != null)
                                    Expanded(
                                      child: Text(
                                        "$label",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Text(
                                      "$value",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          getWidgetC(String? label, dynamic value) {
                            return Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  if (label != null) ...[
                                    Text(
                                      "$label",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                  ],
                                  Expanded(
                                    child: FittedBox(
                                      child: Text(
                                        "$value",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Container(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: getWidget(
                                        null,
                                        "${item.date.day}/${item.date.month}/${item.date.year}",
                                      ),
                                    ),
                                    Expanded(
                                      child: getWidget(
                                        null,
                                        item.activity,
                                      ),
                                    ),
                                    Expanded(
                                      child: getWidget(
                                        null,
                                        item.target,
                                      ),
                                    ),
                                  ],
                                ),
                                GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1.0 / 0.56,
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 6,
                                    crossAxisSpacing: 6,
                                  ),
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  children: [
                                    getWidgetC(
                                      "Date",
                                      "${item.date.day}/${item.date.month}/${item.date.year}",
                                    ),
                                    getWidgetC(
                                      "Activity",
                                      item.activity,
                                    ),
                                    getWidgetC(
                                      "Target",
                                      item.target,
                                    ),
                                    getWidgetC(
                                      "Buying Price",
                                      item.buyingPrice.number,
                                    ),
                                    getWidgetC(
                                      "Selling Price",
                                      item.sellingPrice.number,
                                    ),
                                    getWidgetC(
                                      "Qty",
                                      item.qty.number,
                                    ),
                                    getWidgetC(
                                      "Sisa Volume",
                                      item.sisaVolume.number,
                                    ),
                                    getWidgetC(
                                      "Avg Price",
                                      item.averagePrice.number,
                                    ),
                                    getWidgetC(
                                      "Price",
                                      item.price.number,
                                    ),
                                    getWidgetC(
                                      "Equity by Volume",
                                      item.equitySahamBerdasarkanVolume.number,
                                    ),
                                    getWidgetC(
                                      "Total",
                                      item.total.number,
                                    ),
                                    getWidgetC(
                                      "Saldo",
                                      item.saldo.number,
                                    ),
                                    getWidgetC(
                                      "Modal",
                                      item.modal.number,
                                    ),
                                    getWidgetC(
                                      "Current Price",
                                      item.currentPrice.number,
                                    ),
                                    getWidgetC(
                                      "Valuation",
                                      item.valuation.number,
                                    ),
                                    getWidgetC(
                                      "Current Valuation",
                                      item.currentValuation.number,
                                    ),
                                    getWidgetC(
                                      "PL",
                                      item.pl.number,
                                    ),
                                    getWidgetC(
                                      "Valuation + Saldo",
                                      item.valuationPlusSaldo.number,
                                    ),
                                    getWidgetC(
                                      "Harga Unit",
                                      item.hargaUnit.number,
                                    ),
                                    getWidgetC(
                                      "Jumlah Unit",
                                      item.jumlahUnit.number,
                                    ),
                                    getWidgetC(
                                      "Value Effect",
                                      item.valueEffect.percentage,
                                    ),
                                    getWidgetC(
                                      "Fund Alloc",
                                      item.fundAlloc.percentage,
                                    ),
                                    getWidgetC(
                                      "Yield",
                                      item.yield.percentage,
                                    ),
                                    getWidgetC(
                                      "Sekuritas",
                                      item.sekuritas.number,
                                    ),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 20.0,
                          ),
                          child: Table(
                            children: [
                              TableRow(children: [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Activity",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Buying Price",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Selling Price",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Qty",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Sisa Volume",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Avg Price",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Price",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Equity by Volume",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Total",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Saldo",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Modal",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Current Price",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Valuation",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Current Valuation",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "PL",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Valuation + Saldo",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Harga Unit",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Jumlah Unit",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Value Effect",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Fund Alloc",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Yield",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Sekuritas",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: TRX.historyList.value.length,
                            itemBuilder: (context, index) {
                              var item = TRX.historyList.value[index];
                              //display all fields in flutter table?
                              Color color = Colors.white;
                              if (item.date.year == now.year) {
                                color = index % 2 == 0
                                    ? Colors.grey[100]!
                                    : Colors.grey[300]!;
                              } else {
                                color = index % 2 == 0
                                    ? Colors.blue[100]!
                                    : Colors.blue[300]!;
                              }

                              if (item.activity == "ADJUSTMENT") {
                                color = Colors.red[200]!;
                              }
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 20.0,
                                ),
                                color: color,
                                child: Table(
                                  children: [
                                    TableRow(children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          bottom: 12.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${item.date.day}/${item.date.month}",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            Text(
                                              "${item.date.year}",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        item.activity +
                                            "\n" +
                                            item.target +
                                            "\n" +
                                            item.targetSaham,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.buyingPrice.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.sellingPrice.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        "${item.qty.number}",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.sisaVolume.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.averagePrice.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.price.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.equitySahamBerdasarkanVolume
                                            .number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.total.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.saldo.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.modal.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.currentPrice.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.valuation.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.currentValuation.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.pl.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.valuationPlusSaldo.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.hargaUnit.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.jumlahUnit.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.valueEffect.percentage,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.fundAlloc.percentage,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.yield.percentage,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        item.sekuritas.number,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
