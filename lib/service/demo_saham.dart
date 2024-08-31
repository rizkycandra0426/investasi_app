// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/saham_service.dart';

enum TopupType {
  topup,
  devidenSaham,
  devidenDeposito,
  withdraw,
}

class DemoSahamView extends StatefulWidget {
  DemoSahamView({Key? key}) : super(key: key);

  @override
  State<DemoSahamView> createState() => _DemoSahamViewState();
}

class _DemoSahamViewState extends State<DemoSahamView> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    TRX.generateDummies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Saham"),
        actions: [
          IconButton(
            onPressed: () {
              TRX.generateOneTrade();
              setState(() {});
            },
            icon: Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
          IconButton(
            onPressed: () {
              TRX.generateDummies();
              setState(() {});
            },
            icon: Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: TRX.historyList,
        builder: (context, child, value) {
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              item.activity + "\n" + item.target,
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
                              item.qty.number,
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
                              item.equitySahamBerdasarkanVolume.number,
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
        },
      ),
    );
  }
}
