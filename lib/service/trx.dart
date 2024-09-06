import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/demo_saham.dart';
import 'package:hyper_ui/shared/util/type_extension/date_extension.dart';

enum TopupType {
  topupBalance,
  devidenSaham,
  devidenDeposito,
  withdrawBalance,
  buyDeposito,
}

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

  static int getSisaVolumeTerakhir(String saham) {
    int sisaVolume = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        sisaVolume = item.sisaVolume;
      }
    }
    return sisaVolume;
  }

  static double getLastAvgPrice(String saham) {
    double avgPrice = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        avgPrice = item.averagePrice;
      }
    }
    return avgPrice;
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

  static double getSahamLastCurrentPrice(String saham) {
    double currentPrice = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        currentPrice = item.currentPrice;
      }
    }
    return currentPrice;
  }

  static int getSisaVolumeOfSaham(String saham) {
    int sisaVolume = 0;
    for (var item in historyList.value) {
      if (item.target == saham) {
        sisaVolume = item.sisaVolume;
      }
    }
    return sisaVolume;
  }

  static double updateCurrentPriceOfLastSaham(
      String saham, double newCurrentPrice) {
    for (var item in historyList.value) {
      if (item.target == saham) {
        item.currentPrice = newCurrentPrice;
      }
    }
    sortByDateAndRecalculate();
    return newCurrentPrice;
  }

  static double getLastValuation() {
    return historyList.value.last.valuation;
  }

  static double getLastModal([int? year]) {
    History? item;
    if (year != null) {
      var items = historyList.value.where((item) {
        return item.date.year == year;
      }).toList();
      item = items.isEmpty ? null : items.last;
    }
    return item?.modal ?? 0;
  }

  static double getLastHargaUnit([int? year]) {
    History? item;
    if (year != null) {
      var items = historyList.value.where((item) {
        return item.date.year == year;
      }).toList();
      item = items.isEmpty ? null : items.last;
    }
    return item?.hargaUnit ?? 0;
  }

  static double getlastJumlahUnit([int? year]) {
    History? item;
    if (year != null) {
      var items = historyList.value.where((item) {
        return item.date.year == year;
      }).toList();
      item = items.isEmpty ? null : items.last;
    }
    return item?.jumlahUnit ?? 0;
  }

  static double getLastYield([int? year]) {
    History? item;
    if (year != null) {
      var items = historyList.value.where((item) {
        return item.date.year == year;
      }).toList();
      item = items.isEmpty ? null : items.last;
    }
    return item?.yield ?? 0;
  }

  static double getLastYieldInEndOfMonth(int? year, int month) {
    var items = historyList.value.where((item) {
      return item.date.year == year && item.date.month == month;
    }).toList();
    if (items.isEmpty) {
      return 0;
    }
    return items.last.yield;
  }

  static double getLastValuationPlusSaldo([int? year]) {
    History? item;
    if (year != null) {
      var items = historyList.value.where((item) {
        return item.date.year == year;
      }).toList();
      item = items.isEmpty ? null : items.last;
    }
    return item?.valuationPlusSaldo ?? 0;
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
      type: TopupType.withdrawBalance,
    );
  }

  static getLastDeviden() {
    //where target contains Deposito?
    var items = historyList.value.where((item) {
      return item.target.toString().toLowerCase().contains("deposito");
    }).toList();
    double lastDeviden = 0;
    for (var item in items) {
      lastDeviden = item.deviden;
    }
    return lastDeviden;
  }

  static getLastJumlahDeviden() {
    //where target contains Deposito?
    var items = historyList.value.where((item) {
      return item.target.toString().toLowerCase().contains("deposito");
    }).toList();
    double jumlahDeviden = 0;
    for (var item in items) {
      jumlahDeviden += item.jumlahDeviden;
    }
    return jumlahDeviden;
  }

  static getLastJumlahDevidenWithoutIncrement() {
    //where target contains Deposito?
    var items = historyList.value.where((item) {
      return item.target.toString().toLowerCase().contains("deposito");
    }).toList();
    double jumlahDeviden = 0;
    for (var item in items) {
      jumlahDeviden = item.jumlahDeviden;
    }
    return jumlahDeviden;
  }

  static topup({
    required DateTime date,
    required double amount,
    required TopupType type,
    String? namaBank,
    String? saham,
  }) {
    String typeName = type.name.toString().toUpperCase();
    if (type == TopupType.withdrawBalance) {
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

    double newValuationPlusSaldo = getLastValuationPlusSaldo() + saldo;
    double newJumlahUnit = newValuationPlusSaldo / getHargaUnitTerakhir();
    double newHargaUnit = getHargaUnitTerakhir();

    if (type == TopupType.devidenSaham || type == TopupType.devidenDeposito) {
      newJumlahUnit = getJumlahUnitTerakhir();
      newHargaUnit = newValuationPlusSaldo / newJumlahUnit;
    }

    if (type == TopupType.buyDeposito) {
      saldo = getSaldoTerakhir() - amount;
      newHargaUnit = getHargaUnitTerakhir();
      newJumlahUnit = getJumlahUnitTerakhir();
      modal = getModalTerakhir();
    }

    double newDeviden = 0;
    double newJumlahDeviden = 0;
    if (typeName.contains("DEPOSITO")) {
      if (typeName.contains("BUY")) {
        newDeviden = 0;
        newJumlahDeviden = 0;
      } else {
        newDeviden = amount;
        newJumlahDeviden = getLastJumlahDevidenWithoutIncrement() + amount;
      }
    }

    historyList.value.add(History(
      date: date,
      activity: "TOPUP",
      target: typeName,
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
      namaBank: namaBank ?? '-',
      deviden: newDeviden,
      jumlahDeviden: newJumlahDeviden,
    ));
    sortByDateAndRecalculate();
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
    int volumeTerbaru = getSisaVolumeTerakhir(saham) + qty;
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
    sortByDateAndRecalculate();
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
    int volumeTerbaru = getSisaVolumeTerakhir(saham) + qty;

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
      averagePrice: getLastAvgPrice(saham),
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
    sortByDateAndRecalculate();
  }

  static bool disableCalculate = false;
  static sortByDateAndRecalculate() {
    if (disableCalculate) return;
    disableCalculate = true;

    historyList.value.sort((a, b) => a.date.compareTo(b.date));

    //Recalculate topup, buy and sell?
    //Backup
    List<History> tempHistories = historyList.value;
    historyList.value = [];

    for (var item in tempHistories) {
      if (item.activity == "BUY") {
        // item.qty = item.qty < 0 ? item.qty * -1 : item.qty;
        buy(
          date: item.date,
          qty: item.qty,
          price: item.price,
          currentPrice: item.currentPrice,
          saham: item.target,
        );
      } else if (item.activity == "SELL") {
        // item.qty = item.qty > 0 ? item.qty * -1 : item.qty;
        sell(
          date: item.date,
          qty: item.qty < 0 ? item.qty * -1 : item.qty,
          price: item.price,
          currentPrice: item.currentPrice,
          saham: item.target,
        );
      } else if (item.activity == "TOPUP") {
        var type = TopupType.topupBalance;

        if (item.target.toString().toLowerCase().contains("saham")) {
          type = TopupType.devidenSaham;
        } else if (item.target
            .toString()
            .toLowerCase()
            .contains("buydeposito")) {
          type = TopupType.buyDeposito;
        } else if (item.target.toString().toLowerCase().contains("deposito")) {
          type = TopupType.devidenDeposito;
        } else if (item.target.toString().toLowerCase().contains("withdraw")) {
          type = TopupType.withdrawBalance;
          if (item.price < 0) {
            item.price = item.price * -1;
          }
        }

        topup(
          date: item.date,
          amount: item.price,
          type: type,
          saham: item.targetSaham == "-" ? null : item.targetSaham,
          namaBank: item.namaBank ?? '-',
        );
      } else if (item.activity == "ADJUSTMENT") {
        addAdjustment(
          date: item.date,
        );
      }
    }
    disableCalculate = false;
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
      type: TopupType.topupBalance,
    );
    // topup(date: DateTime(2024, 01, 01), amount: 100000000);

    buy(
      date: DateTime(2024, 02, 01),
      qty: 1000,
      price: 1000,
      currentPrice: 1200,
      saham: "BBCA",
    );

    sell(
      date: DateTime(2024, 03, 01),
      qty: 500,
      price: 1200,
      currentPrice: 1000,
      saham: "BBCA",
    );

    buy(
      date: DateTime(2024, 04, 01),
      qty: 1000,
      price: 3000,
      currentPrice: 3000,
      saham: "BBCA",
    );

    topup(
      date: DateTime(2024, 05, 01),
      amount: 10000000,
      type: TopupType.buyDeposito,
      namaBank: "MANDIRI",
    );

    topup(
      date: DateTime(2024, 06, 01),
      amount: 5000000,
      type: TopupType.devidenDeposito,
    );

    topup(
      date: DateTime(2024, 07, 01),
      amount: 5000000,
      type: TopupType.devidenDeposito,
    );
    //----------------- 2025 -----------------

    addAdjustment(
      date: DateTime(2025, 1, 1),
    );

    topup(
      date: DateTime(2025, 1, 01),
      amount: 100000000,
      type: TopupType.topupBalance,
    );

    buy(
      date: DateTime(2025, 1, 01),
      qty: 1000,
      price: 1000,
      currentPrice: 2000,
      saham: "BBCA",
    );

    buy(
      date: DateTime(2025, 2, 01),
      qty: 1000,
      price: 4000,
      currentPrice: 5000,
      saham: "BBCA",
    );

    buy(
      date: DateTime(2025, 3, 01),
      qty: 1000,
      price: 6000,
      currentPrice: 7000,
      saham: "BBCA",
    );

    sell(
      date: DateTime(2025, 4, 01),
      qty: 500,
      price: 7000,
      currentPrice: 6000,
      saham: "BBCA",
    );

    topup(
      date: DateTime(2025, 5, 01),
      amount: 1000000,
      type: TopupType.devidenSaham,
      saham: "BBCA",
    );

    topup(
      date: DateTime(2025, 7, 01),
      amount: 2000000,
      type: TopupType.devidenDeposito,
    );

    withdraw(
      date: DateTime(2025, 11, 01),
      amount: 5000000,
    );

    buy(
      date: DateTime(2025, 12, 01),
      qty: 1000,
      price: 3000,
      currentPrice: 6000,
      saham: "ABBA",
    );

    buy(
      date: DateTime(2025, 12, 01),
      qty: 1000,
      price: 4000,
      currentPrice: 5000,
      saham: "ABBA",
    );
  }

  static generateOneTrade() {
    topup(
      date: now,
      amount: 1000000,
      type: TopupType.topupBalance,
    );
  }

  static List<History> get portofolioSaham {
    var namaSahamList = [];
    var list = historyList.value.where((item) {
      return item.activity == "BUY" ||
          item.activity == "SELL" ||
          item.sisaVolume > 0;
    }).toList();
    namaSahamList = list
        .map((item) {
          return item.target;
        })
        .toSet()
        .toList();

    List<History> lastRecordOfSaham = [];

    for (var namaSaham in namaSahamList) {
      var item = list.lastWhere((item) {
        return item.target == namaSaham;
      });
      lastRecordOfSaham.add(item);
    }

    return lastRecordOfSaham;
  }

  static List<History> get tradeHistories {
    return historyList.value.where((item) {
      if (item.targetSaham.length >= 3) return true;
      return item.activity == "BUY" || item.activity == "SELL";
    }).toList();
  }

  static List<History> get danaHistories {
    return historyList.value.where((item) {
      return item.activity == "TOPUP";
    }).toList();
  }

  static getImageFromSaham(String saham) {
    return StockNewService.stocks.firstWhere((item) {
      return item["nama_saham"] == saham;
    })["pic"];
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
  String namaBank;

  double deviden;
  double jumlahDeviden;

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
    this.namaBank = "-",
    this.deviden = 0,
    this.jumlahDeviden = 0,
  });
}

extension DateStringExtension on String {
  DateTime get date {
    return DateTime.parse(this);
  }
}
