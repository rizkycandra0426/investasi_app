import 'dart:convert';
import 'dart:ffi';

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

  static Future saveRecord() async {
    List<Map<String, dynamic>> values = [];
    for (var item in historyList.value) {
      if (item.jumlahUnit.isInfinite) {
        item.jumlahUnit = 0;
      }

      if (item.yieldValue.isNaN) {
        item.yieldValue = 0;
      }

      values.add(item.toJson());
    }

    await DBService.set("historyList", jsonEncode(values));
  }

  static Future loadRecord() async {
    var jsonString = await DBService.get("historyList");
    if (jsonString != null) {
      List<dynamic> obj = jsonDecode(jsonString);
      List<History> list = obj.map((item) {
        return History.fromJson(item);
      }).toList();
      historyList.value = list;
    }
  }

  static Future resetRecord() async {}

  static double getHargaUnitTerakhir() {
    if (historyList.value.isEmpty) return 1000;
    return historyList.value.last.hargaUnit;
  }

  static double getAllAmountTotalByNamaBank(String namaBank) {
    double total = 0;
    for (var item in historyList.value) {
      if (item.namaBank == namaBank && item.target == "BUYDEPOSITO") {
        total += item.total;
      }
    }
    return total;
  }

  static double getJumlahUnitTerakhir() {
    if (historyList.value.isEmpty) return 0;
    return historyList.value.last.jumlahUnit;
  }

  static double getSaldoTerakhir() {
    if (historyList.value.isEmpty) return 0;
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

  static List<Map<String, dynamic>> getUniqueNamaBankList() {
    List<String> namaBankList = [];
    for (var item in danaHistories) {
      if (item.namaBank != "-") {
        namaBankList.add(item.namaBank);
      }
    }

    namaBankList = namaBankList.toSet().toList();

    List<Map<String, dynamic>> valueList = [];
    for (var namaBank in namaBankList) {
      valueList.add({
        "label": namaBank,
        "value": namaBank,
      });
    }
    return valueList;
    //return where label is unique?
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

  static double getLastCurrentValuation(String saham) {
    double currentValuation = 0;
    for (var item in historyList.value) {
      if (item.activity == "SELL") {
        currentValuation = item.valuation;
      } else if (item.activity == "BUY") {
        currentValuation = item.valuation;
      }
    }
    return currentValuation;
  }

  static double getLastCurrentValuationOfYear(int year) {
    double currentValuation = 0;
    for (var item in historyList.value) {
      if (item.date.year == year) {
        currentValuation = item.currentValuation;
      }
    }
    return currentValuation;
  }

  static double getTotalValuationOfLastRecordOfUniqueSaham(int year) {
    List<String> uniqueSaham =
        historyList.value.map((e) => e.target).toSet().toList();
    double valuationTotal = 0;
    for (var saham in uniqueSaham) {
      //get valuation from saham from lastest record with saham?
      var sahamHistories = historyList.value.where((item) {
        return item.target == saham &&
            item.date.year == year &&
            (item.activity == "BUY" || item.activity == "SELL");
      }).toList();
      if (sahamHistories.isEmpty) continue;
      valuationTotal += sahamHistories.last.valuation;
    }
    return valuationTotal;
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

  static double getOtherSahamValuation(String targetSaham) {
    List<String> uniqueSaham =
        historyList.value.map((e) => e.target).toSet().toList();
    double valuationTotal = 0;
    for (var saham in uniqueSaham) {
      //get valuation from saham from lastest record with saham?
      var sahamHistories = historyList.value.where((item) {
        return item.target == saham && item.target != targetSaham;
      }).toList();
      if (sahamHistories.isEmpty) continue;
      valuationTotal += sahamHistories.last.valuation;
    }
    return valuationTotal;
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
    if (historyList.value.isEmpty) return 0;
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
    return item?.yieldValue ?? 0;
  }

  static double getLastYieldInRecord() {
    if (historyList.value.isEmpty) return 0;
    return historyList.value.last.yieldValue;
  }

  static double getLastYieldInEndOfMonth(int? year, int month) {
    var items = historyList.value.where((item) {
      return item.date.year == year && item.date.month == month;
    }).toList();
    if (items.isEmpty) {
      return 0;
    }
    return items.last.yieldValue;
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

  static double getValuationTotalInYear(int year) {
    var items = historyList.value.where((item) {
      return item.date.year == year;
    }).toList();
    double total = 0;
    for (var item in items) {
      total += item.valuation;
    }
    return total;
  }

  static double getTotalBuyInYear(int year) {
    var items = historyList.value.where((item) {
      return item.date.year == year &&
          (item.activity == "BUY" || item.activity == "SELL");
    }).toList();
    double total = 0;
    for (var item in items) {
      total += item.total;
    }
    return total;
  }

  static double getTotalOfEquityByVolumeOfUniqueSahamInYear(int year) {
    List<String> uniqueSaham =
        historyList.value.map((e) => e.target).toSet().toList();
    double total = 0;
    for (var saham in uniqueSaham) {
      //get valuation from saham from lastest record with saham?
      var sahamHistories = historyList.value.where((item) {
        return item.target == saham && item.date.year == year;
      }).toList();
      if (sahamHistories.isEmpty) continue;
      total += sahamHistories.last.equitySahamBerdasarkanVolume;
    }
    return total;
  }

  static double getLastFloatingReturnInYear([int? year]) {
    History? item;
    if (year != null) {
      var items = historyList.value.where((item) {
        return item.date.year == year && item.pl > 0;
      }).toList();
      item = items.isEmpty ? null : items.last;
    }
    return item?.pl ?? 0;
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

  static getLastJumlahDevidenWithoutIncrement(String namaBank) {
    //where target contains Deposito?
    var items = historyList.value.where((item) {
      return item.target.toString().toLowerCase().contains("deposito") &&
          item.namaBank == namaBank;
    }).toList();
    double jumlahDeviden = 0;
    for (var item in items) {
      jumlahDeviden = item.total;
    }
    return jumlahDeviden;
  }

  static getJumlahDeviden(String namaBank) {
    var items = historyList.value.where((item) {
      return item.target.toString().toLowerCase().contains("deposito") &&
          item.namaBank == namaBank;
    }).toList();
    double jumlahDeviden = 0;
    for (var item in items) {
      jumlahDeviden += item.deviden;
    }
    return jumlahDeviden;
  }

  static double getLastDevidenRecordByNamaSaham(String namaBank) {
    var items = historyList.value.where((item) {
      return item.target.toString().toLowerCase().contains("devidendeposito") &&
          item.namaBank == namaBank;
    }).toList();
    double jumlahDeviden = 0;
    for (var item in items) {
      jumlahDeviden = item.deviden;
    }
    return jumlahDeviden;
  }

  static bool isLastBuyDepositoOrDevidenDepositoRecord(
      int index, String namaBank) {
    int lastIndex = historyList.value.lastIndexWhere((item) =>
        (item.target == "BUYDEPOSITO" || item.target == "DEVIDENDEPOSITO") &&
        item.namaBank == namaBank);
    if (index == lastIndex) return true;
    return false;
  }

  static double getDevidenTerakhir(String namaBank) {
    var items = historyList.value.where((item) {
      return item.target.toString().toLowerCase().contains("deposito") &&
          item.namaBank == namaBank;
    }).toList();
    double jumlahDeviden = 0;
    for (var item in items) {
      jumlahDeviden = item.deviden;
    }
    return jumlahDeviden;
  }

  static getHargaUnitDiawalTahun(int year) {
    historyList.value.sort((a, b) => a.date.compareTo(b.date));

    var items = historyList.value.where((item) {
      return item.date.year == year;
    }).toList();

    return items.first.hargaUnit;
  }

  static topup({
    required DateTime date,
    required double amount,
    required TopupType type,
    String? namaBank,
    String? saham,
  }) {
    initStockForYearIfHistoryInYearIsEmpty(date.year);
    String typeName = type.name.toString().toUpperCase();
    if (type == TopupType.withdrawBalance) {
      amount = amount * -1;
    }

    if (type == TopupType.devidenSaham && saham == null) {
      throw Exception("Nama saham wajib di isi pada topup saham!");
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
      newValuationPlusSaldo = saldo + valuation;
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
        newDeviden = getAllAmountTotalByNamaBank(namaBank!);
        newJumlahDeviden = getJumlahDeviden(namaBank);
      } else {
        newDeviden = amount;
        newJumlahDeviden = getJumlahDeviden(namaBank!) + amount;
      }
    }

    var newYield = getLastYieldInRecord();
    if (type == TopupType.topupBalance) {
      newYield = getLastYieldInRecord();
    } else if (type == TopupType.buyDeposito) {
      newYield = getLastYieldInRecord();
    } else if (type == TopupType.devidenDeposito ||
        type == TopupType.devidenSaham) {
      double hargaUnitDiawalTahun = getHargaUnitDiawalTahun(date.year);
      newYield =
          (newHargaUnit - hargaUnitDiawalTahun) / hargaUnitDiawalTahun * 100;
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
      yieldValue: newYield,
    ));
    sortByDateAndRecalculate();
  }

  static bool lastBuyOrSellIsEqualToSaham(String targetSaham) {
    var items = historyList.value.where((item) {
      return item.target == targetSaham;
    }).toList();

    if (items.isEmpty) {
      return false;
    }

    return items.last.target == targetSaham;
  }

  static double getCurrentFloatingReturn(int year) {
    return TRX.getTotalValuationOfLastRecordOfUniqueSaham(year) -
        TRX.getTotalOfEquityByVolumeOfUniqueSahamInYear(year);
  }

  static buy({
    required DateTime date,
    required int qty,
    required double price,
    required double currentPrice,
    required String saham,
    String? sekuritas,
  }) {
    initStockForYearIfHistoryInYearIsEmpty(date.year);

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

    //  currentValuation = getLastCurrentValuation(saham) + valuation;
    double currentValuation = 0;
    double otherSahamValuation = getOtherSahamValuation(saham);
    currentValuation = otherSahamValuation + valuation;

    double pl = valuation - equityByVolume;

    double valuationPlusSaldo = saldoTerbaru + currentValuation;
    hargaUnit = valuationPlusSaldo / jumlahUnit;

    double valueEffect = (valuation / valuationPlusSaldo) * 100;
    double fundAlloc = (equityByVolume / modal) * 100;

    // double yield =
    //     ((hargaUnit - getHargaUnitTerakhir()) / getHargaUnitTerakhir()) * 100;
    double hargaUnitDiawalTahun = getHargaUnitDiawalTahun(date.year);
    double yield =
        (hargaUnit - hargaUnitDiawalTahun) / hargaUnitDiawalTahun * 100;

    // if (lastBuyOrSellIsEqualToSaham(saham) == false) {
    //   yield = yield + getLastYieldInRecord();
    // }

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
      yieldValue: yield,
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
    initStockForYearIfHistoryInYearIsEmpty(date.year);
    qty = qty * -1;

    double hargaUnit = getHargaUnitTerakhir();
    double jumlahUnit = getJumlahUnitTerakhir();
    double modal = getModalTerakhir();

    double total = qty * price;
    int volumeTerbaru = getSisaVolumeTerakhir(saham) + qty;

    double saldoTerbaru = getSaldoTerakhir() - total;
    // double equityByVolume =
    //     getEquitySahamBerdasarkanVolumeTerakhir(saham) + total;

    double equityByVolume = volumeTerbaru * getLastAvgPrice(saham);

    double valuation = volumeTerbaru * currentPrice;

    // double currentValuation = getLastCurrentValuation(saham) - valuation;
    // if (valuation == 0) {
    //   currentValuation = 0;
    // }

    double currentValuation = 0;
    double otherSahamValuation = getOtherSahamValuation(saham);
    currentValuation = otherSahamValuation + valuation;

    double pl = valuation - equityByVolume;

    double valuationPlusSaldo = saldoTerbaru + currentValuation;
    hargaUnit = valuationPlusSaldo / jumlahUnit;

    double valueEffect = (valuation / valuationPlusSaldo) * 100;
    // double fundAlloc = (equityByVolume / modal) * 100;
    double fundAlloc = ((volumeTerbaru * getLastAvgPrice(saham)) / modal) * 100;

    double hargaUnitDiawalTahun = getHargaUnitDiawalTahun(date.year);
    double yield =
        (hargaUnit - hargaUnitDiawalTahun) / hargaUnitDiawalTahun * 100;

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
      yieldValue: yield,
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
      // item.valuation = 0;
      // item.currentValuation = item.valuation;

//if item.jumlahUnit is infinity set to 0?
      if (item.jumlahUnit.isInfinite) {
        item.jumlahUnit = 0;
      }

      if (item.activity == "BUY") {
        // item.qty = item.qty < 0 ? item.qty * -1 : item.qty;
        buy(
          date: item.date,
          qty: item.qty,
          price: item.price,
          currentPrice: item.currentPrice,
          saham: item.target,
          sekuritas: item.sekuritas,
        );
      } else if (item.activity == "SELL") {
        // item.qty = item.qty > 0 ? item.qty * -1 : item.qty;
        sell(
          date: item.date,
          qty: item.qty < 0 ? item.qty * -1 : item.qty,
          price: item.price,
          currentPrice: item.currentPrice,
          saham: item.target,
          sekuritas: item.sekuritas,
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

  static initStock() {
    if (historyList.value.isEmpty) {
      addAdjustment(
        date: DateTime(2024, 1, 1),
      );
      return;
    }
  }

  static initStockForYearIfHistoryInYearIsEmpty(int year) {
    var items = historyList.value.where((item) {
      return item.date.year == year;
    }).toList();
    if (items.isEmpty) {
      addAdjustment(
        date: DateTime(year, 1, 1),
      );
    }
  }

  static cleanData() {
    historyList.value.clear();
    addAdjustment(
      date: DateTime(2024, 1, 1),
    );
  }

  static generateCustomDummies() {
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
      amount: 10000000,
      type: TopupType.topupBalance,
    );

    buy(
      date: DateTime(2024, 02, 01),
      qty: 1000,
      price: 1000,
      currentPrice: 2000,
      saham: "ABBA",
    );

    topup(
      date: DateTime(2024, 5, 01),
      amount: 1000000,
      type: TopupType.devidenSaham,
      saham: "ABBA",
    );

    sell(
      date: DateTime(2024, 06, 01),
      qty: 500,
      price: 1200,
      currentPrice: 2000,
      saham: "ABBA",
    );

    sell(
      date: DateTime(2024, 07, 01),
      qty: 500,
      price: 1200,
      currentPrice: 2000,
      saham: "ABBA",
    );
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
      date: DateTime(2024, 05, 02),
      amount: 5000000,
      type: TopupType.devidenDeposito,
      namaBank: "MANDIRI",
    );

    topup(
      date: DateTime(2024, 05, 03),
      amount: 5000000,
      type: TopupType.devidenDeposito,
      namaBank: "MANDIRI",
    );

    topup(
      date: DateTime(2024, 05, 04),
      amount: 10000000,
      type: TopupType.buyDeposito,
      namaBank: "MANDIRI",
    );

    topup(
      date: DateTime(2024, 06, 01),
      amount: 10000000,
      type: TopupType.buyDeposito,
      namaBank: "BBCA",
    );

    topup(
      date: DateTime(2024, 06, 02),
      amount: 5000000,
      type: TopupType.devidenDeposito,
      namaBank: "BBCA",
    );

    topup(
      date: DateTime(2024, 06, 03),
      amount: 5000000,
      type: TopupType.devidenDeposito,
      namaBank: "BBCA",
    );

    topup(
      date: DateTime(2024, 06, 04),
      amount: 10000000,
      type: TopupType.buyDeposito,
      namaBank: "BBCA",
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
      namaBank: "BBCA",
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
    if (StockNewService.stocks.isEmpty) {
      StockNewService.initialize();
    }

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
  double yieldValue;
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
    this.yieldValue = 0,
    this.sekuritas = "-",
    this.namaBank = "-",
    this.deviden = 0,
    this.jumlahDeviden = 0,
  });

  //fromJson?
  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      date: DateTime.parse(json["date"]),
      activity: json["activity"],
      target: json["target"],
      targetSaham: json["targetSaham"],
      buyingPrice: json["buyingPrice"],
      sellingPrice: json["sellingPrice"],
      qty: json["qty"],
      sisaVolume: json["sisaVolume"],
      averagePrice: json["averagePrice"],
      price: json["price"],
      equitySahamBerdasarkanVolume: json["equitySahamBerdasarkanVolume"],
      total: json["total"],
      saldo: json["saldo"],
      modal: json["modal"],
      currentPrice: json["currentPrice"],
      valuation: json["valuation"],
      currentValuation: json["currentValuation"],
      pl: json["pl"],
      valuationPlusSaldo: json["valuationPlusSaldo"],
      hargaUnit: json["hargaUnit"],
      jumlahUnit: json["jumlahUnit"],
      valueEffect: json["valueEffect"],
      fundAlloc: json["fundAlloc"],
      yieldValue: json["yield"],
      sekuritas: json["sekuritas"],
      namaBank: json["namaBank"],
      deviden: json["deviden"],
      jumlahDeviden: json["jumlahDeviden"],
    );
  }

  //toJson?
  Map<String, dynamic> toJson() {
    return {
      "date": date.toString(),
      "activity": activity,
      "target": target,
      "targetSaham": targetSaham,
      "buyingPrice": buyingPrice,
      "sellingPrice": sellingPrice,
      "qty": qty,
      "sisaVolume": sisaVolume,
      "averagePrice": averagePrice,
      "price": price,
      "equitySahamBerdasarkanVolume": equitySahamBerdasarkanVolume,
      "total": total,
      "saldo": saldo,
      "modal": modal,
      "currentPrice": currentPrice,
      "valuation": valuation,
      "currentValuation": currentValuation,
      "pl": pl,
      "valuationPlusSaldo": valuationPlusSaldo,
      "hargaUnit": hargaUnit,
      "jumlahUnit": jumlahUnit,
      "valueEffect": valueEffect,
      "fundAlloc": fundAlloc,
      "yield": yieldValue,
      "sekuritas": sekuritas,
      "namaBank": namaBank,
      "deviden": deviden,
      "jumlahDeviden": jumlahDeviden,
    };
  }
}

extension DateStringExtension on String {
  DateTime get date {
    return DateTime.parse(this);
  }
}
