// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class DemoSahamView extends StatefulWidget {
  DemoSahamView({Key? key}) : super(key: key);

  @override
  State<DemoSahamView> createState() => _DemoSahamViewState();
}

class _DemoSahamViewState extends State<DemoSahamView> {
  ValueNotifier<List<History>> historyList = ValueNotifier(histories);

  double getHargaUnitTerakhir() {
    return historyList.value.last.hargaUnit;
  }

  double getSaldoTerakhir() {
    return historyList.value.last.saldo;
  }

  double getModalTerakhir() {
    var items = historyList.value.where((item) => item.modal != 0).toList();
    if (items.isEmpty) {
      return 0;
    }
    return items.last.modal;
  }

  int getVolumeSaatIni(String saham) {
    int volume = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        volume += item.qty;
      }
    }
    return volume;
  }

  double getEquitySahamBerdasarkanVolumeTerakhir(String saham) {
    double equity = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        equity = item.equitySahamBerdasarkanVolume;
      }
    }
    return equity;
  }

  double getLastValuationBySaham(String saham) {
    double valuation = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        valuation = item.valuation;
      }
    }
    return valuation;
  }

  addAdjustment({
    required DateTime date,
  }) {
    if (historyList.value.isEmpty) {
      historyList.value.add(History(
        date: date,
        activity: "Adjustment",
        target: "Balance",
        buyingPrice: 0,
        sellingPrice: 0,
        qty: 0,
        sisaVolume: 0,
        price: 0,
        total: 0,
        saldo: 0,
        currentPrice: 0,
        valuation: 0,
        pl: 0,
        valuationPlusSaldo: 0,
        hargaUnit: 1000,
        jumlahUnit: 0,
      ));
    } else {
      historyList.value.add(History(
        date: date,
        activity: "Adjustment",
        target: "Balance",
        buyingPrice: 0,
        sellingPrice: 0,
        qty: 0,
        sisaVolume: 0,
        price: 0,
        total: 0,
        saldo: 0,
        currentPrice: 0,
        valuation: 0,
        pl: 0,
        valuationPlusSaldo: 0,
        hargaUnit: 1000,
        jumlahUnit: 0,
      ));
    }
  }

  topup({
    required DateTime date,
    required double amount,
  }) {
    double saldo = getSaldoTerakhir() + amount;
    double modal = getModalTerakhir() + amount;
    double valuationPlusSaldo = saldo;
    //---------------------------------
    //---------------------------------
    double hargaUnit = getHargaUnitTerakhir();
    double jumlahUnit = valuationPlusSaldo / hargaUnit;
    historyList.value.add(History(
      date: date,
      activity: "Topup",
      target: "Saldo",
      buyingPrice: 0,
      sellingPrice: 0,
      qty: 1,
      sisaVolume: 0,
      price: amount,
      total: amount,
      saldo: saldo,
      modal: modal,
      currentPrice: 0,
      valuation: 0,
      pl: 0,
      valuationPlusSaldo: valuationPlusSaldo,
      hargaUnit: hargaUnit,
      jumlahUnit: jumlahUnit,
    ));
  }

  buy({
    required DateTime date,
    required int qty,
    required double price,
    required double currentPrice,
    required String saham,
    String? sekuritas,
  }) {
    double hargaUnit = getHargaUnitTerakhir();
    double jumlahUnit = 100000;
    double modal = getModalTerakhir();

    double total = qty * price;
    int volumeTerbaru = getVolumeSaatIni(saham) + qty;
    double saldoTerbaru = getSaldoTerakhir() - total;
    double equityByVolume =
        getEquitySahamBerdasarkanVolumeTerakhir(saham) + total;
    double averagePrice = equityByVolume / volumeTerbaru;

    double valuation = volumeTerbaru * currentPrice;
    double currentValuation = getLastValuationBySaham(saham) + valuation;
    double pl = valuation - equityByVolume;

    double valuationPlusSaldo = saldoTerbaru + currentValuation;
    hargaUnit = (saldoTerbaru + valuation) / jumlahUnit;

    double valueEffect = (valuation / valuationPlusSaldo) * 100;
    double fundAlloc = (equityByVolume / modal) * 100;
    double yield =
        ((hargaUnit - getHargaUnitTerakhir()) / getHargaUnitTerakhir()) * 100;

    historyList.value.add(History(
      date: date,
      activity: "BUY",
      target: saham,
      buyingPrice: 1000,
      sellingPrice: 0,
      qty: qty,
      sisaVolume: volumeTerbaru,
      averagePrice: averagePrice,
      price: price,
      equitySahamBerdasarkanVolume: equityByVolume,
      total: total,
      saldo: saldoTerbaru,
      modal: modal,
      currentPrice: currentPrice,
      valuation: valuation,
      currentValuation: currentValuation,
      pl: pl,
      valuationPlusSaldo: valuationPlusSaldo,
      hargaUnit: hargaUnit,
      jumlahUnit: jumlahUnit,
      valueEffect: valueEffect,
      fundAlloc: fundAlloc,
      yield: yield,
      sekuritas: sekuritas ?? "-",
    ));
  }

  sell({
    required DateTime date,
    required int qty,
    required double price,
    required double currentPrice,
    required String saham,
    String? sekuritas,
  }) {
    qty = qty * -1;

    double hargaUnit = getHargaUnitTerakhir();
    double jumlahUnit = 100000;
    double modal = getModalTerakhir();

    double total = qty * price;
    int volumeTerbaru = getVolumeSaatIni(saham) + qty;
    double saldoTerbaru = getSaldoTerakhir() - total;
    double equityByVolume =
        getEquitySahamBerdasarkanVolumeTerakhir(saham) + total;

    double valuation = volumeTerbaru * currentPrice;
    double currentValuation = getLastValuationBySaham(saham) - valuation;
    double pl = valuation - equityByVolume;

    double valuationPlusSaldo = saldoTerbaru + currentValuation;
    hargaUnit = valuationPlusSaldo / jumlahUnit;

    double valueEffect = (valuation / valuationPlusSaldo) * 100;
    double fundAlloc = (equityByVolume / modal) * 100;
    double yield =
        ((hargaUnit - getHargaUnitTerakhir()) / getHargaUnitTerakhir()) * 100;

    historyList.value.add(History(
      date: date,
      activity: "SELL",
      target: saham,
      buyingPrice: 1000,
      sellingPrice: 0,
      qty: qty,
      sisaVolume: volumeTerbaru,
      price: price,
      equitySahamBerdasarkanVolume: equityByVolume,
      total: total,
      saldo: saldoTerbaru,
      modal: modal,
      currentPrice: currentPrice,
      valuation: valuation,
      currentValuation: currentValuation,
      pl: pl,
      valuationPlusSaldo: valuationPlusSaldo,
      hargaUnit: hargaUnit,
      jumlahUnit: jumlahUnit,
      valueEffect: valueEffect,
      fundAlloc: fundAlloc,
      yield: yield,
      sekuritas: sekuritas ?? "-",
    ));
  }

  generateDummies() {
    historyList.value.clear();

    double hargaUnit = -1;
    double jumlahUnit = -1;
    if (historyList.value.isEmpty) {
      hargaUnit = 1000;
    }
    addAdjustment(
      date: DateTime(2024, 1, 1),
    );

    int qty = 1;
    double price = 100000000;
    double total = qty * price;

    topup(date: DateTime(2024, 01, 01), amount: 100000000);
    // topup(date: DateTime(2024, 01, 01), amount: 100000000);

    buy(
      date: DateTime(2024, 01, 01),
      qty: 1000,
      price: 1000,
      currentPrice: 1200,
      saham: "BBCA",
    );

    sell(
      date: DateTime(2024, 01, 01),
      qty: 500,
      price: 1200,
      currentPrice: 1000,
      saham: "BBCA",
    );

    buy(
      date: DateTime(2024, 01, 01),
      qty: 1000,
      price: 3000,
      currentPrice: 3000,
      saham: "BBCA",
    );

    //----------------- 2025 -----------------

    addAdjustment(
      date: DateTime(2025, 1, 1),
    );

    topup(date: DateTime(2025, 01, 01), amount: 100000000);

    buy(
      date: DateTime(2025, 01, 01),
      qty: 1000,
      price: 1000,
      currentPrice: 2000,
      saham: "BBCA",
    );

    buy(
      date: DateTime(2025, 01, 01),
      qty: 1000,
      price: 4000,
      currentPrice: 5000,
      saham: "BBCA",
    );

    buy(
      date: DateTime(2025, 01, 01),
      qty: 1000,
      price: 6000,
      currentPrice: 7000,
      saham: "BBCA",
    );

    sell(
      date: DateTime(2025, 01, 01),
      qty: 1000,
      price: 1200,
      currentPrice: 6000,
      saham: "BBCA",
    );
    setState(() {});
  }

  generateOneTrade() {
    historyList.value.add(History(
      date: "2024-01-01".date,
      activity: "Topup",
      target: "Saldo",
      buyingPrice: 0,
      sellingPrice: 0,
      qty: 0,
      sisaVolume: 0,
      price: 0,
      total: 100000000,
      saldo: 100000000,
      currentPrice: 0,
      valuation: 0,
      pl: 0,
      valuationPlusSaldo: 100000000,
      hargaUnit: 0,
      jumlahUnit: 0,
    ));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    generateDummies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Saham"),
        actions: [
          IconButton(
            onPressed: () => generateOneTrade(),
            icon: Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
          IconButton(
            onPressed: () => generateDummies(),
            icon: Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: historyList,
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: histories.length,
                itemBuilder: (context, index) {
                  var item = histories[index];
                  //display all fields in flutter table?
                  Color color = Colors.white;
                  if (item.date.year == now.year) {
                    color =
                        index % 2 == 0 ? Colors.grey[100]! : Colors.grey[300]!;
                  } else {
                    color =
                        index % 2 == 0 ? Colors.blue[100]! : Colors.blue[300]!;
                  }

                  if (item.activity == "Adjustment") {
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
            ],
          );
        },
      ),
    );
  }
}

List<History> histories = [];

class History {
  DateTime date;
  String activity;
  String target;
  double buyingPrice;
  double sellingPrice;
  int qty;
  int sisaVolume;
  double averagePrice;
  double price;

  double equitySahamBerdasarkanVolume;

  double total;
  double saldo;

  double modal;

  double currentPrice;
  double valuation;
  double currentValuation;

  double pl;
  double valuationPlusSaldo;
  double hargaUnit;
  double jumlahUnit;

  double valueEffect;
  double fundAlloc;
  double yield;
  String sekuritas;

  History({
    required this.date,
    required this.activity,
    required this.target,
    this.buyingPrice = 0,
    this.sellingPrice = 0,
    this.qty = 0,
    this.sisaVolume = 0,
    this.averagePrice = 0,
    this.price = 0,
    this.equitySahamBerdasarkanVolume = 0,
    this.total = 0,
    this.saldo = 0,
    this.modal = 0,
    this.currentPrice = 0,
    this.valuation = 0,
    this.currentValuation = 0,
    this.pl = 0,
    this.valuationPlusSaldo = 0,
    this.hargaUnit = 0,
    this.jumlahUnit = 0,
    this.valueEffect = 0,
    this.fundAlloc = 0,
    this.yield = 0,
    this.sekuritas = "-",
  });
}

extension DateStringExtension on String {
  DateTime get date {
    return DateTime.parse(this);
  }
}
