import 'package:flutter/material.dart';
import 'package:hyper_ui/service/demo_saham.dart';

class TRX {
  static ValueNotifier<List<History>> historyList = ValueNotifier(histories);

  static double getHargaUnitTerakhir() {
    return historyList.value.last.hargaUnit;
  }

  static double getJumlahUnitTerakhir() {
    return historyList.value.last.jumlahUnit;
  }

  static double getSaldoTerakhir() {
    return historyList.value.last.saldo;
  }

  static double getModalTerakhir() {
    var items = historyList.value.where((item) => item.modal != 0).toList();
    if (items.isEmpty) {
      return 0;
    }
    return items.last.modal;
  }

  static int getVolumeSaatIni(String saham) {
    int volume = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        volume += item.qty;
      }
    }
    return volume;
  }

  static double getEquitySahamBerdasarkanVolumeTerakhir(String saham) {
    double equity = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        equity = item.equitySahamBerdasarkanVolume;
      }
    }
    return equity;
  }

  static double getLastValuationBySaham(String saham) {
    double valuation = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        valuation = item.valuation;
      }
    }
    return valuation;
  }

  static double getLastValuation() {
    return historyList.value.last.valuation;
  }

  static double getLastValuationPlusSaldo() {
    return historyList.value.last.valuationPlusSaldo;
  }

  static addAdjustment({
    required DateTime date,
  }) {
    if (historyList.value.isEmpty) {
      historyList.value.add(History(
        date: date,
        activity: "ADJUSTMENT",
        target: "BALANCE",
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
      double saldoTerakhir = getSaldoTerakhir();
      double lastValuationPlusSaldo = getLastValuationPlusSaldo();
      double hargaUnit = getHargaUnitTerakhir();
      double jumlahUnit = getJumlahUnitTerakhir();

      historyList.value.add(History(
        date: date,
        activity: "ADJUSTMENT",
        target: "BALANCE",
        buyingPrice: 0,
        sellingPrice: 0,
        qty: 1,
        sisaVolume: 0,
        price: lastValuationPlusSaldo,
        total: lastValuationPlusSaldo,
        saldo: saldoTerakhir,
        currentPrice: 0,
        valuation: getLastValuation(),
        currentValuation: 0,
        pl: 0,
        valuationPlusSaldo: lastValuationPlusSaldo,
        hargaUnit: hargaUnit,
        jumlahUnit: jumlahUnit,
      ));
    }
  }

  static withdraw({
    required DateTime date,
    required double amount,
  }) {
    topup(
      date: date,
      amount: amount,
      type: TopupType.withdraw,
    );
  }

  static topup({
    required DateTime date,
    required double amount,
    required TopupType type,
    String? saham,
  }) {
    if (type == TopupType.withdraw) {
      amount = amount * -1;
    }

    if (type == TopupType.devidenSaham && saham == null) {
      print("Nama saham wajib di isi pada topup saham!");
      return;
    }
    double saldo = getSaldoTerakhir() + amount;
    double modal = getModalTerakhir() + amount;
    double valuationPlusSaldo = saldo;
    //---------------------------------
    //---------------------------------
    double hargaUnit = getHargaUnitTerakhir();
    double jumlahUnit = valuationPlusSaldo / hargaUnit;
    double valuation = getLastValuation();

    double newValuationPlusSaldo = getLastValuationPlusSaldo() + amount;
    double newJumlahUnit = newValuationPlusSaldo / getHargaUnitTerakhir();
    double newHargaUnit = getHargaUnitTerakhir();

    if (type == TopupType.devidenSaham || type == TopupType.devidenDeposito) {
      newJumlahUnit = getJumlahUnitTerakhir();
      newHargaUnit = newValuationPlusSaldo / newJumlahUnit;
    }

    historyList.value.add(History(
      date: date,
      activity: "TOPUP",
      target: type.name.toUpperCase(),
      buyingPrice: 0,
      sellingPrice: 0,
      qty: 1,
      sisaVolume: 0,
      price: amount,
      total: amount,
      saldo: saldo,
      modal: modal,
      currentPrice: 0,
      valuation: valuation,
      pl: 0,
      valuationPlusSaldo: newValuationPlusSaldo,
      hargaUnit: newHargaUnit,
      jumlahUnit: newJumlahUnit,
      targetSaham: type == TopupType.devidenSaham ? saham! : "-",
    ));
  }

  static buy({
    required DateTime date,
    required int qty,
    required double price,
    required double currentPrice,
    required String saham,
    String? sekuritas,
  }) {
    double hargaUnit = getHargaUnitTerakhir();
    double jumlahUnit = getJumlahUnitTerakhir();
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
    hargaUnit = valuationPlusSaldo / jumlahUnit;

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

  static sell({
    required DateTime date,
    required int qty,
    required double price,
    required double currentPrice,
    required String saham,
    String? sekuritas,
  }) {
    qty = qty * -1;

    double hargaUnit = getHargaUnitTerakhir();
    double jumlahUnit = getJumlahUnitTerakhir();
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

  static generateDummies() {
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

    topup(
      date: DateTime(2024, 01, 01),
      amount: 100000000,
      type: TopupType.topup,
    );
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

    topup(
      date: DateTime(2025, 01, 01),
      amount: 100000000,
      type: TopupType.topup,
    );

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
      qty: 500,
      price: 7000,
      currentPrice: 6000,
      saham: "BBCA",
    );

    topup(
      date: DateTime(2025, 01, 01),
      amount: 1000000,
      type: TopupType.devidenSaham,
      saham: "BBCA",
    );

    topup(
      date: DateTime(2025, 01, 01),
      amount: 2000000,
      type: TopupType.devidenDeposito,
    );

    withdraw(
      date: DateTime(2025, 01, 01),
      amount: 5000000,
    );
  }

  static generateOneTrade() {
    historyList.value.add(History(
      date: "2024-01-01".date,
      activity: "TOPUP",
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
  }
}

List<History> histories = [];

class History {
  DateTime date;
  String activity;
  String target;
  String targetSaham;
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
    this.targetSaham = "-",
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
