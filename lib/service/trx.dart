import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

enum TopupType {
  topupBalance,
  devidenSaham,
  devidenDeposito,
  withdrawBalance,
  buyDeposito,
}

class TRX {
  static ValueNotifier<List<History>> historyList = ValueNotifier(histories);

  static availableYears() {
    List<int> years = [now.year];
    for (var item in historyList.value) {
      years.add(item.date.year);
    }
    years.sort();
    return years.toSet().toList();
  }

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
    //sort history list by date?
    historyList.value.sort((a, b) => a.date.compareTo(b.date));

    if (historyList.value.isEmpty) return 0;
    return historyList.value.last.saldo;
  }

  static double getSaldoTerakhirDiTahun(int year) {
    var items = historyList.value.where((item) {
      return item.date.year == year;
    }).toList();
    if (items.isEmpty) return 0;
    return items.last.saldo;
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

  static double getLastCurrentValuationOfAllSaham() {
    double currentValuation = 0;
    for (var item in historyList.value) {
      if (item.activity == "SELL") {
        currentValuation = item.currentValuation;
      } else if (item.activity == "BUY") {
        currentValuation = item.currentValuation;
      }
    }
    return currentValuation;
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

  static double getCurrentValuationInYear(int year) {
    double valuation = 0;
    for (var item in historyList.value) {
      if (item.date.year == year) {
        valuation = item.currentValuation;
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

  static double getOtherSahamValuation(String targetSaham) {
    List<String> uniqueSaham =
        historyList.value.map((e) => e.target).toSet().toList();
    double valuationTotal = 0;
    for (var saham in uniqueSaham) {
      //get valuation from saham from lastest record with saham?
      var sahamHistories = historyList.value.where((item) {
        return item.target == saham &&
            item.target != targetSaham &&
            (item.activity == "BUY" || item.activity == "SELL");
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

  static int updateCurrentPriceOfLastSaham(
      String saham, double newCurrentPrice) {
    var index =
        historyList.value.lastIndexWhere((element) => element.target == saham);
    historyList.value[index].currentPrice = newCurrentPrice;

    sortByDateAndRecalculate();

    //# Perbaikan issue yield tidak benar
    // topup(
    //   date: historyList.value[index].date.add(Duration(seconds: 1)),
    //   amount: 0,
    //   type: TopupType.devidenSaham,
    //   saham: saham,
    // );
    //#END

    return index;
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

  static double getTotalEquitySahamBerdasarkanVolumeTerakhir() {
    List<String> uniqueSaham =
        historyList.value.map((e) => e.target).toSet().toList();
    double totalEquity = 0;
    for (var saham in uniqueSaham) {
      var x = getEquitySahamBerdasarkanVolumeTerakhir(saham);
      totalEquity += x;
    }
    return totalEquity;
  }

  static double getTotalEquitySahamBerdasarkanVolumeTerakhirByYear(int year) {
    List<String> uniqueSaham =
        historyList.value.map((e) => e.target).toSet().toList();
    double totalEquity = 0;
    for (var saham in uniqueSaham) {
      var x = getEquitySahamBerdasarkanVolumeTerakhir(saham);
      totalEquity += x;
    }
    return totalEquity;
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
    //---------------------------------
    //---------------------------------

    double valuation = getLastValuation();

    double currentValuation = getLastCurrentValuationOfYear(date.year);

    double newValuationPlusSaldo = getLastValuationPlusSaldo() + saldo;
    double newJumlahUnit = newValuationPlusSaldo / getHargaUnitTerakhir();
    double newHargaUnit = getHargaUnitTerakhir();

    // if (amount == 1000000 && type == TopupType.devidenDeposito) {
    //   print(getLastValuationPlusSaldo());
    //   print(getLastValuationPlusSaldo());
    // }

    if (type == TopupType.devidenSaham) {
      valuation = getLastCurrentValuationOfAllSaham();
    }

    // if (type == TopupType.devidenSaham || type == TopupType.devidenDeposito) {
    //   newValuationPlusSaldo = saldo + valuation;
    //   newJumlahUnit = getJumlahUnitTerakhir();
    //   newHargaUnit = newValuationPlusSaldo / newJumlahUnit;
    // }

    if (type == TopupType.devidenSaham) {
      newValuationPlusSaldo = saldo + currentValuation;
      newJumlahUnit = getJumlahUnitTerakhir();
      newHargaUnit = newValuationPlusSaldo / newJumlahUnit;
    }

    if (type == TopupType.buyDeposito) {
      saldo = getSaldoTerakhir() - amount;
      valuation = getLastCurrentValuationOfAllSaham();
      newValuationPlusSaldo = saldo + currentValuation;
      // newHargaUnit = getHargaUnitTerakhir();
      // newJumlahUnit = getJumlahUnitTerakhir();
      newJumlahUnit = TRX.getJumlahUnit(date.year);
      newHargaUnit = newValuationPlusSaldo / newJumlahUnit;
      modal = getModalTerakhir();
    }

    if (type == TopupType.devidenDeposito) {
      newValuationPlusSaldo = saldo + currentValuation;
      newJumlahUnit = getJumlahUnitTerakhir();
      // newHargaUnit = modal / newJumlahUnit;
      newHargaUnit = newValuationPlusSaldo / newJumlahUnit;
    }

    if (type == TopupType.withdrawBalance) {
      // saldo = getSaldoTerakhir() - amount;
      valuation = getLastCurrentValuationOfAllSaham();
      newValuationPlusSaldo = saldo + currentValuation;
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
      newValuationPlusSaldo = saldo + currentValuation;
      newYield = getLastYieldInRecord();
    } else if (type == TopupType.buyDeposito) {
      //Versi lama-nya hanya baris ini
      // newYield = getLastYieldInRecord();
      double hargaUnitDiawalTahun = getHargaUnitDiawalTahun(date.year);
      newYield =
          (newHargaUnit - hargaUnitDiawalTahun) / hargaUnitDiawalTahun * 100;

      print("BUYDEPOSITO: ${newYield}");
    } else if (type == TopupType.devidenDeposito ||
        type == TopupType.devidenSaham) {
      double hargaUnitDiawalTahun = getHargaUnitDiawalTahun(date.year);
      newYield =
          (newHargaUnit - hargaUnitDiawalTahun) / hargaUnitDiawalTahun * 100;

      print("valuation: ${valuation.number}");
      print("newHargaUnit: ${newHargaUnit.number}");
      print("hargaUnitDiawalTahun: ${hargaUnitDiawalTahun.number}");
      print("newYield: ${newYield.number}");
      print("newValuationPlusSaldo: ${newValuationPlusSaldo.number}");
      print("~~~~");
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
      currentValuation: currentValuation,
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

    if (type == TopupType.topupBalance) {
      historyList.value.last.jumlahUnit = TRX.getJumlahUnit(date.year);
    }
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
    // double jumlahUnit = getJumlahUnitTerakhir();
    double jumlahUnit = TRX.getJumlahUnit(date.year);

    double modal = getModalTerakhir();

    double total = qty * price;
    int volumeTerbaru = getSisaVolumeTerakhir(saham) + qty;
    double saldoTerbaru = getSaldoTerakhir() - total;
    printg("BUY");
    printg("${historyList.value.last.date}");
    printg("${historyList.value.last.activity}");
    printg("${historyList.value.last.target}");
    printg("saldoTerbaru: ${saldoTerbaru.number}");
    printg("total: ${total.number}");
    printg("~~~~~~~~~~~~~~");

    double equityByVolume =
        getEquitySahamBerdasarkanVolumeTerakhir(saham) + total;
    double averagePrice = equityByVolume / volumeTerbaru;

    double valuation = volumeTerbaru * currentPrice;

    //  currentValuation = getLastCurrentValuation(saham) + valuation;
    double currentValuation = 0;
    double otherSahamValuation = getOtherSahamValuation(saham);
    currentValuation = otherSahamValuation + valuation;

    double profitAndLoss = valuation - equityByVolume;

    // double valuationPlusSaldo = saldoTerbaru + currentValuation;
    double valuationPlusSaldo = saldoTerbaru + currentValuation;
    hargaUnit = valuationPlusSaldo / jumlahUnit;

    double valueEffect = (valuation / valuationPlusSaldo) * 100;
    double fundAlloc = (equityByVolume / modal) * 100;

    // double yield =
    //     ((hargaUnit - getHargaUnitTerakhir()) / getHargaUnitTerakhir()) * 100;
    // double hargaUnitDiawalTahun = getHargaUnitDiawalTahun(date.year);
    double hargaUnitDiawalTahun = getHargaUnitTerakhir();

    double yield =
        (hargaUnit - hargaUnitDiawalTahun) / hargaUnitDiawalTahun * 100;

    if (date.year == 2025) {
      print("~~~~");
      print("2025: saldoTerbaru: ${saldoTerbaru}");
      print("2025: valuation: ${valuation}");
      print("2025: hargaUnit: ${hargaUnit}");
      print("2025: hargaUnitDiawalTahun: ${hargaUnitDiawalTahun}");
      print("2025: valuationPlusSaldo: ${valuationPlusSaldo}");
      print("2025: jumlahUnit: ${jumlahUnit}");
      print("2025: yield: ${yield}");
      print("~~~~");
    }

    // if (lastBuyOrSellIsEqualToSaham(saham) == false) {
    //   yield = yield + getLastYieldInRecord();
    // }

    if (qty == 0) {
      yield = getLastYieldInRecord();
    }

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
      pl: profitAndLoss,
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
    if (qty > 0) {
      qty = qty * -1;
    }

    double hargaUnit = getHargaUnitTerakhir();
    double jumlahUnit = getJumlahUnitTerakhir();
    double modal = getModalTerakhir();

    double total = qty * price;
    int volumeTerbaru = getSisaVolumeTerakhir(saham) + qty;

    double saldoTerbaru = getSaldoTerakhir() - total;
    printr("SELL");
    printr("${historyList.value.last.date}");
    printr("${historyList.value.last.activity}");
    printr("${historyList.value.last.target}");
    printr("saldoTerbaru: ${saldoTerbaru.number}");
    printr("total: ${total.number}");
    printr("~~~~~~~~~~~~~~");
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
          namaBank: item.namaBank,
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
    StockNewService.ihsgStart = 0;
    StockNewService.ihsgEnd = 0;
    StockNewService.ihsgEndNextYear = 0;
    StockNewService.ihsgStartNextYear = 0;
    DBService.set("ihsg_start", "0");
    DBService.set("ihsg_end", "0");

    addAdjustment(
      date: DateTime(2024, 1, 1),
    );
    saveRecord();
  }

  static double getJumlahUnit([int? year]) {
    var total = 0.0;
    if (year != null) {
      if (year != DateTime.now().year) {
        total = getJumlahUnit(year - 1);
      }
    }
    if (year != null) {
      if (TRX.danaHistories.where((i) => i.date.year == year).isEmpty) {
        var items =
            TRX.danaHistories.where((i) => i.date.year == year - 1).toList();
        for (var item in items) {
          if (item.target == "DEVIDENSAHAM") continue;
          if (item.target == "DEVIDENDEPOSITO") continue;
          if (item.target == "BUYDEPOSITO") continue;
          if (item.date.year != year - 1) continue;
          double jumlahUnit = item.total / item.hargaUnit;
          total += jumlahUnit;
        }
        return total;
      }
    }

    TRX.danaHistories.forEach((item) {
      if (item.target == "DEVIDENSAHAM") return;
      if (item.target == "DEVIDENDEPOSITO") return;
      if (item.target == "BUYDEPOSITO") return;
      if (year != null && item.date.year != year) return;

      double jumlahUnit = item.total / item.hargaUnit;
      total += jumlahUnit;
    });
    return total;
  }

  static generateCustomDummies() {
    historyList.value.clear();

    addAdjustment(
      date: DateTime(2024, 1, 1),
    );

    topup(
      date: DateTime(2024, 01, 01),
      amount: 10000000,
      type: TopupType.topupBalance,
    );

    buy(
      date: DateTime(2024, 01, 02),
      qty: 1000,
      price: 1000,
      currentPrice: 1500,
      saham: "ABBA",
    );

    buy(
      date: DateTime(2024, 01, 02),
      qty: 1000,
      price: 1000,
      currentPrice: 2000,
      saham: "BBCA",
    );

    // TRX.topup(
    //   date: TRX.historyList.value[recordIndex].date.add(Duration(seconds: 1)),
    //   amount: 0,
    //   type: TopupType.devidenSaham,
    //   saham: widget.item.target,
    // );

    // topup(
    //   date: DateTime(2024, 01, 02),
    //   amount: 1000000,
    //   type: TopupType.topupBalance,
    // );

    // topup(
    //   date: DateTime(2024, 01, 03),
    //   amount: 1000000,
    //   type: TopupType.devidenSaham,
    //   saham: "ABBA",
    // );

    // topup(
    //   date: DateTime(2024, 01, 03),
    //   amount: 1000000,
    //   type: TopupType.devidenSaham,
    //   saham: "BBCA",
    // );

    // topup(
    //   date: DateTime(2024, 01, 05),
    //   amount: 1000000,
    //   type: TopupType.buyDeposito,
    //   namaBank: "MANDIRI",
    // );

    // topup(
    //   date: DateTime(2024, 01, 07),
    //   amount: 1000000,
    //   type: TopupType.devidenDeposito,
    //   namaBank: "MANDIRI",
    // );

    // withdraw(
    //   date: DateTime(2024, 01, 08),
    //   amount: 1000000,
    // );

    // buy(
    //   date: DateTime(2025, 01, 02),
    //   qty: 1000,
    //   price: 1500,
    //   currentPrice: 2000,
    //   saham: "ABBA",
    // );

    // sell(
    //   date: DateTime(2024, 01, 09),
    //   qty: 500,
    //   price: 2200,
    //   currentPrice: 2000,
    //   saham: "ABBA",
    // );

    // topup(
    //   date: DateTime(2024, 05, 04),
    //   amount: 1000000,
    //   type: TopupType.devidenDeposito,
    //   namaBank: "MANDIRI",
    // );

    // buy(
    //   date: DateTime(2024, 05, 05),
    //   qty: 1000,
    //   price: 2000,
    //   currentPrice: 2000,
    //   saham: "ABBA",
    // );

    // sell(
    //   date: DateTime(2024, 01, 02),
    //   qty: 500,
    //   price: 1000,
    //   currentPrice: 1500,
    //   saham: "BBCA",
    // );

    // topup(
    //   date: DateTime(2024, 01, 03),
    //   amount: 1000000,
    //   type: TopupType.topupBalance,
    // );

    // buy(
    //   date: DateTime(2024, 02, 01),
    //   qty: 1000,
    //   price: 1000,
    //   currentPrice: 1500,
    //   saham: "BBCA",
    // );

    // topup(
    //   date: DateTime(2024, 05, 02),
    //   amount: 1000000,
    //   type: TopupType.devidenSaham,
    //   saham: "ABBA",
    // );

    // topup(
    //   date: DateTime(2024, 05, 03),
    //   amount: 1000000,
    //   type: TopupType.buyDeposito,
    //   namaBank: "MANDIRI",
    // );

    // topup(
    //   date: DateTime(2024, 05, 04),
    //   amount: 1000000,
    //   type: TopupType.devidenDeposito,
    //   namaBank: "MANDIRI",
    // );
  }

  static generateDummies() {
    historyList.value.clear();

    addAdjustment(
      date: DateTime(2024, 1, 1),
    );

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
