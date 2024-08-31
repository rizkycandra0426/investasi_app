import 'dart:convert';

import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/offline_service.dart';
import 'package:hyper_ui/service/stock_data.dart';

class StockNewService {
  static List stocks = [];
  static List tradeHistories = [];

  static List get sortedStocks {
    //sort by nama saham?
    stocks.sort((a, b) => a["nama_saham"].compareTo(b["nama_saham"]));
    return stocks;
  }

  static List get cleanStocks {
    for (var index = 0; index < StockNewService.stocks.length; index++) {
      var fundAlloc = StockNewService.stocks[index]["fund_alloc"];
      var valueEffect = StockNewService.stocks[index]["value_effect"];
      if (fundAlloc.isNaN) {
        fundAlloc = 0;
      }
      if (valueEffect.isNaN) {
        valueEffect = 0;
      }

      //if fund_alloc is Infinity, set to 0?

      // StockNewService.stocks[index]["fund_alloc"] = fundAlloc;
      // StockNewService.stocks[index]["value_effect"] = valueEffect;
      StockNewService.stocks[index]["fund_alloc"] = 0;
      StockNewService.stocks[index]["value_effect"] = 0;
    }

    stocks = jsonDecode(jsonEncode(stocks).replaceAll("Infinity", "0"));
    return stocks;
  }

  static double costTotal = 0.0;
  static double valuationTotal = 0.0;
  static double ihsgStart = 0.0;
  static double ihsgEnd = 0.0;
  static double get ihsg {
    var newIhsg = (ihsgEnd - ihsgStart) / ihsgStart;
    if (newIhsg.isNaN) {
      return 0;
    }
    return newIhsg * 100;
  }

  static double ihsgStartNextYear = 0.0;
  static double ihsgEndNextYear = 0.0;
  static double get ihsgNextYear {
    var newIhsg = (ihsgEndNextYear - ihsgStartNextYear) / ihsgStartNextYear;
    if (newIhsg.isNaN) {
      return 0;
    }
    return newIhsg * 100;
  }

  static double getYieldInPercent(int year) {
    var yield =
        ((UserBalanceService.getHargaUnitSaatIni(year) - 1000) / 1000) * 100;
    return yield;
  }

  static double getYieldNextYear(int year) {
    // harga
    var yield = (UserBalanceService.getHargaUnitSaatIni(year) - 1000) / 1000;
    return yield;
  }

  static double get jumlahPerUnit {
    return currentUserSaldo / 1000;
  }

  static calculate() {
    costTotal = 0;
    valuationTotal = 0;

    for (var stock in stocks) {
      var currentVolume = stock["buy_volume"] - stock["sell_volume"];
      stock["valuation"] = currentVolume * stock["current_price"];
      stock["floating_return"] = stock["valuation"] - stock["buy_total"];

      costTotal = costTotal + (stock["buy_volume"] * stock["buy_price"]);
      valuationTotal = valuationTotal + (stock["valuation"] ?? 0);

      //---------------------------
      //---------------------------
    }

    for (var item in tradeHistories) {
      //-----
      if (item["action"] == "BUY") {
        item["valuation"] = item["volume"] * item["buying_price"];
        item["floating_return"] = item["valuation"] - item["cost"];
      } else if (item["action"] == "SELL") {
        item["valuation"] = -1 * item["volume"] * item["current_price"];
        item["floating_return"] = -1 * (item["valuation"] - 0);
        item["cost"] = 0;
      }
    }

    for (var item in tradeHistories) {
      //-----
      if (item["action"] == "BUY") {
        item["fund_alloc"] = item["cost"] / UserBalanceService.saldo;
        double valuationTotal = 0;
        for (var subItem in tradeHistories) {
          valuationTotal += subItem["valuation"];
        }

        item["value_effect"] =
            item["valuation"] / (UserBalanceService.saldo - valuationTotal);
      } else if (item["action"] == "SELL") {
        item["fund_alloc"] = item["cost"] / UserBalanceService.saldo;
        double valuationTotal = 0;
        for (var subItem in tradeHistories) {
          valuationTotal += subItem["valuation"];
        }

        item["value_effect"] =
            item["valuation"] / (UserBalanceService.saldo - valuationTotal);
      }
    }

    // for (var stock in stocks) {
    //   costTotal = costTotal + (stock["buy_volume"] * stock["buy_price"]);
    //   valuationTotal = valuationTotal + (stock["valuation"] ?? 0);
    // }

    for (var stock in stocks) {
      var currentVolume = (stock["buy_volume"] - stock["sell_volume"]);
      var buyTotal = currentVolume * stock["buy_price"];

      var div1 = (UserBalanceService.sisaSaldo + costTotal);
      stock["fund_alloc"] = (buyTotal / div1);

      var div2 = (UserBalanceService.sisaSaldo + valuationTotal);
      stock["value_effect"] = (stock["valuation"] / div2);

      if (div1 == 0) {
        stock["fund_alloc"] = 0;
      }

      if (div2 == 0) {
        stock["value_effect"] = 0;
      }
    }

    print("costTotal: $costTotal");
    print("valuationTotal: $valuationTotal");
  }

  static initialize() async {
    if (stocks.isNotEmpty) return;
    getStockFromDummies();
  }

  static getStockFromDummies() async {
    var lines = stockData.split("\n");
    for (var line in lines) {
      if (!line.contains(",")) continue;
      var values = line.split(",");
      if (values.isEmpty) continue;
      var idSaham = values[0];
      var namaSaham = values[1];
      var namaPerusahaan = values[2];
      var pic = values[3];
      var buyVolume = 0;
      var sellVolume = 0;
      var buyPrice = 0;
      var sellPrice = 0;
      var currentPrice = double.tryParse(values[8].toString()) ?? 0;
      var buyTotal = 0;
      var currentTotal = 0;
      var floatingReturn = 0;
      var fundAlloc = 0;
      var valueEffect = 0;
      var sekuritas = "-";

      stocks.add({
        "id_saham": idSaham,
        "nama_saham": namaSaham,
        "nama_perusahaan": namaPerusahaan,
        "pic": pic,
        "buy_volume": buyVolume,
        "sell_volume": sellVolume,
        "buy_price": buyPrice,
        "sell_price": sellPrice,
        "current_price": currentPrice,
        "buy_total": buyTotal,
        "current_total": currentTotal,
        "floating_return": floatingReturn,
        "fund_alloc": fundAlloc,
        "value_effect": valueEffect,
        "sekuritas": sekuritas,
      });
    }
  }

  static Future<double> getRealtimePrice(symbol) async {
    try {
      var response = await dio.get(
        "/price/$symbol",
      );
      return double.tryParse("${response.data["data"]["price"]}") ?? 0;
    } on Exception catch (err) {
      printr("GET PRICE ERROR: $err");
      return 0;
    }
  }

  static void buy({
    required String idSaham,
    required double volume,
    required double price,
    required Map stock,
    required DateTime date,
  }) {
    //get avg_price ?
    double avgPrice = 0;
    //###########################

    String namaSaham = stocks
        .where((element) => element["id_saham"] == idSaham)
        .first["nama_saham"];

    tradeHistories.add({
      "date": date.toString(),
      "id_saham": idSaham,
      "nama_saham": namaSaham,
      "volume": volume,
      "price": price,
      "total": volume * price,
      "action": "BUY",
      "stock": stock,
      //------------------------
      //------------------------
      "buying_price": price,
      "avg_price": avgPrice,
      "current_price": avgPrice,
      "selling_price": 0,
      "cost": 0,
      "valuation": 0,
      "floating_return": 0,
      "fund_alloc": 0,
      "value_effect": 0,
    });

    //GET AVERAGE PRICE
    var currentStockHistories = tradeHistories
        .where((element) => element["id_saham"] == idSaham)
        .toList();

    double buyingPriceTotal = 0;
    double currentStockVolume = 0;
    double currentTradeCount = 0;
    for (var item in currentStockHistories) {
      if (item["action"] == "SELL") continue;
      // currentStockTotal += (item["volume"] * item["buying_price"]);
      buyingPriceTotal += item["buying_price"];
      currentStockVolume += item["volume"];
      currentTradeCount++;
    }
    avgPrice = buyingPriceTotal / currentTradeCount;

    printo("currentStockTotal: buyingPriceTotal ${buyingPriceTotal}");
    printo("currentStockTotal: currentTradeCount ${currentTradeCount}");
    printo("currentStockTotal: avgPrice ${avgPrice}");
    tradeHistories[tradeHistories.length - 1]["avg_price"] = avgPrice;
    tradeHistories[tradeHistories.length - 1]["current_price"] = avgPrice;
    tradeHistories[tradeHistories.length - 1]["cost"] =
        volume * tradeHistories[tradeHistories.length - 1]["buying_price"];
    // tradeHistories[tradeHistories.length - 1]["cost"] = avgPrice;
    //#END

    var lastItem = StockNewService.tradeHistories
        .where((i) => i["id_saham"] == idSaham)
        .toList();
    lastItem.last["current_price"] = avgPrice;

    calculate();
    OfflineService.saveLocalValues();
  }

  static void sell({
    required String idSaham,
    required double volume,
    required double price,
    required Map stock,
    required DateTime date,
  }) {
    //Get avg_price?
    double avgPrice = 0;

    //harga saat ini, valuation
    String namaSaham = stocks
        .where((element) => element["id_saham"] == idSaham)
        .first["nama_saham"];
    tradeHistories.add({
      "date": date.toString(),
      "id_saham": idSaham,
      "nama_saham": namaSaham,
      "volume": -1 * volume,
      "price": price,
      "total": volume * price,
      "action": "SELL",
      "stock": stock,
      //------------------------
      //------------------------
      "buying_price": price,
      "avg_price": avgPrice,
      "current_price": avgPrice,
      "selling_price": price,
      "cost": avgPrice * volume,
      "valuation": 0,
      "floating_return": 0,
      "fund_alloc": 0,
      "value_effect": 0,
    });

    //GET AVERAGE PRICE
    var currentStockHistories = tradeHistories
        .where((element) => element["id_saham"] == idSaham)
        .toList();

    double buyingPriceTotal = 0;
    double currentStockVolume = 0;
    double currentTradeCount = 0;
    for (var item in currentStockHistories) {
      if (item["action"] == "SELL") continue;
      // currentStockTotal += (item["volume"] * item["buying_price"]);
      buyingPriceTotal += item["buying_price"];
      currentStockVolume += item["volume"];
      currentTradeCount++;
    }
    avgPrice = buyingPriceTotal / currentTradeCount;

    printo("currentStockTotal: buyingPriceTotal ${buyingPriceTotal}");
    printo("currentStockTotal: currentTradeCount ${currentTradeCount}");
    printo("currentStockTotal: avgPrice ${avgPrice}");
    tradeHistories[tradeHistories.length - 1]["avg_price"] = avgPrice;
    tradeHistories[tradeHistories.length - 1]["current_price"] = avgPrice;
    tradeHistories[tradeHistories.length - 1]["cost"] = volume * avgPrice;
    // tradeHistories[tradeHistories.length - 1]["cost"] = avgPrice;
    //#END

    calculate();
    OfflineService.saveLocalValues();
  }

  static double get sellTotalFromTradehistories {
    double total = 0;
    for (var history in tradeHistories) {
      if (history["action"] == "SELL") {
        total = total + history["total"];
      }
    }
    return total;
  }

  static getSummary(String? idSaham) {
    var items = [];

    if (idSaham != null) {
      items = tradeHistories.where((i) => i["id_saham"] == idSaham).toList();
    } else {
      items = tradeHistories;
    }
    var costTotal = 0.0;
    var valuationTotal = 0.0;
    var floatingReturnTotal = 0.0;
    var fundAllocTotal = 0.0;
    var valueEffectTotal = 0.0;

    var volumeTotal = 0.0;

    double sellTotal = 0.0;
    double lastCurrentPrice = 0;
    double lastAveragePrice = 0;
    for (var item in items) {
      volumeTotal = volumeTotal + item["volume"];

      costTotal += item["cost"];
      valuationTotal += item["valuation"];
      floatingReturnTotal += item["floating_return"];
      fundAllocTotal += item["fund_alloc"];
      valueEffectTotal += item["value_effect"];
      if (item["action"] == "SELL") {
        sellTotal += item["total"];
      }
      lastCurrentPrice = item["current_price"];
      lastAveragePrice = item["avg_price"];
    }

    var summaryTotal = costTotal - sellTotal;
    var summaryValuation = (volumeTotal * lastCurrentPrice);
    var summaryFloatingReturn = summaryValuation - summaryTotal;

    // var allStockValuation = 0.0;
    // for (var stock in stocks) {
    //   if (stock["buy_volume"] - stock["sell_volume"] <= 0) continue;
    //   var item = getSummary(stock["id_saham"]);
    //   allStockValuation += item["valuation"];
    // }

    // var valueEffect =
    //     (summaryValuation / (UserBalanceService.sisaSaldo + allStockValuation));

    return {
      "volume": volumeTotal,
      "avg_price": lastAveragePrice,
      "cost": summaryTotal,
      "valuation": summaryValuation,
      "floating_return": summaryFloatingReturn,
      "fund_alloc": fundAllocTotal,
      // "value_effect": valueEffectTotal,
      "value_effect": 0.0,
    };
  }

  static double getAllStockValuationsTotalCalculatedByYearsBefore(int year) {
    // double beforeValue = getAllStockValuationsTotal(year - 1);
    // double nowValue = getAllStockValuationsTotal(year);
    // return beforeValue + nowValue;
    // double beforeValue = getAllStockValuationsTotal(year - 1);
    double nowValue = getAllStockValuationsTotal(year);
    return nowValue;
  }

  static double getAllStockBuyTotalCalculatedByYearsBefore(int year) {
    // double beforeValue = getAllStockBuyTotal(year - 1);
    // double nowValue = getAllStockBuyTotal(year);
    // return beforeValue + nowValue;

    // double beforeValue = getAllStockBuyTotal(year - 1);
    double nowValue = getAllStockBuyTotal(year);
    return nowValue;
  }

  static double getAllStockValuationsTotal(int year) {
    var allStockValuationsTotal = 0.0;
    for (var stock in StockNewService.stocks) {
      double volumeTotal = 0.0;
      double lastCurrentPrice = 0;
      for (var history in StockNewService.tradeHistories) {
        if (DateTime.parse(history["date"]).year != year) continue;
        if (history["id_saham"] == stock["id_saham"]) {
          volumeTotal = volumeTotal + history["volume"];
          lastCurrentPrice = history["current_price"] ?? 0.0;
        }
      }
      var summaryValuation = (volumeTotal * lastCurrentPrice);
      allStockValuationsTotal += summaryValuation;
    }
    printg("allStockValuationsTotal: $allStockValuationsTotal");
    return allStockValuationsTotal;
  }

  static double getAllStockBuyTotal(int year) {
    var allStockValuationsTotal = 0.0;
    var allStockBuyTotal = 0.0;
    for (var stock in StockNewService.stocks) {
      if (stock["buy_volume"] - stock["sell_volume"] <= 0) continue;

      double volumeTotal = 0.0;
      double lastCurrentPrice = 0;
      double lastAveragePrice = 0;
      for (var history in StockNewService.tradeHistories) {
        if (DateTime.parse(history["date"]).year != year) continue;
        if (history["id_saham"] == stock["id_saham"]) {
          volumeTotal = volumeTotal + history["volume"];
          lastCurrentPrice = history["current_price"] ?? 0.0;
          lastAveragePrice = history["avg_price"] ?? 0.0;

          if (history["action"] == "BUY") {
            allStockBuyTotal += (history["cost"] ?? 0);
          } else {
            allStockBuyTotal -= (history["total"] ?? 0);
          }
        }
      }
      var summaryValuation = (volumeTotal * lastCurrentPrice);
      allStockValuationsTotal += summaryValuation;
    }
    return allStockBuyTotal;
  }
}

// shared_preferences
// sqlite

class UserBalanceService {
  static List topupHistories = [
    /*
    date
    amount (bisa minus, artinya WD)
    harga_unit (harga unit saat ini)
    jumlah_unit (amount/harga_unit)
    */
  ];

  static double get saldo {
    double amountTotal = 0;
    for (var history in topupHistories) {
      amountTotal = amountTotal + history["amount"];
    }
    return amountTotal;
  }

  static topup(double amount, bool isTopupDividen, [DateTime? date]) {
    double hargaUnit = 0;
    double jumlahUnit = 0;
    if (topupHistories.isEmpty) {
      //first time topup
      hargaUnit = 1000;
      jumlahUnit = amount / 1000;
    } else {
      //after first time topup
      hargaUnit = getHargaUnitSaatIni((date ?? now).year);
      jumlahUnit = amount / hargaUnit;
    }

    if (isTopupDividen) {
      topupHistories.add({
        "date": (date ?? DateTime.now()).toString(),
        "amount": amount,
        "harga_unit": 0,
        "jumlah_unit": 0,
      });
      return;
    } else {
      topupHistories.add({
        "date": (date ?? DateTime.now()).toString(),
        "amount": amount,
        "harga_unit": hargaUnit,
        "jumlah_unit": jumlahUnit,
      });
    }
  }

  static withdraw(double amount) {
    double hargaUnit = getHargaUnitSaatIni(now.year);
    topupHistories.add({
      "date": DateTime.now().toString(),
      "amount": -amount,
      "harga_unit": hargaUnit,
      "jumlah_unit": -amount / getHargaUnitSaatIni(now.year),
    });
  }

  static double getJumlahUnit(int year) {
    double jumlah = 0;
    for (var history in topupHistories) {
      if (DateTime.parse(history["date"]).year != year) continue;

      jumlah = jumlah + history["jumlah_unit"];
    }
    return jumlah;
  }

  static double getHargaUnitSaatIni(int year) {
    if (StockNewService.getAllStockValuationsTotal(year) == 0) return 1000;
    return (sisaSaldo + StockNewService.getAllStockBuyTotal(year)) /
        getJumlahUnit(year);
  }

  static double get sisaSaldo {
    return UserBalanceService.saldo -
        StockNewService.costTotal +
        getSellTotal(now.year);
  }

  static double getSellTotal(int year) {
    double total = 0;
    for (var history in StockNewService.tradeHistories) {
      if (history["action"] == "SELL") {
        total = total + history["total"];
      }
    }
    return total;
  }

  static double getBuyTotal(int year) {
    double total = 0;
    for (var history in StockNewService.tradeHistories) {
      if (history["action"] == "BUY") {
        total = total + history["cost"];
      }
    }
    return total;
  }

  static double get sisaSaldoPlusSellValuation {
    return UserBalanceService.saldo;
    return UserBalanceService.saldo -
        StockNewService.costTotal +
        StockNewService.sellTotalFromTradehistories;
  }
}

class LocalIHSGService {
  // month, year, yield, ihsg
  static List<Map<String, dynamic>> histories = [];

  static getHistoryByYearAndMonth({
    required int year,
    required int month,
  }) {
    for (var history in histories) {
      if (history["month"] == month && history["year"] == year) {
        return history;
      }
    }
    return {};
  }

  static getLastValue({
    required int year,
  }) {
    var items = histories.where((element) => element["year"] == year).toList();
    items.sort((a, b) => b["month"].compareTo(a["month"]));
    return items;
  }

  static getYearValues({
    required int year,
  }) {
    var items = histories.where((element) => element["year"] == year).toList();
    items.sort((a, b) => a["month"].compareTo(b["month"]));
    return items;
  }

  static insertOrUpdate({
    required DateTime date,
    required double yield,
    required double ihsg,
  }) {
    //if exists, update
    for (var history in histories) {
      if (history["month"] == date.month && history["year"] == date.year) {
        history["yield"] = yield;
        history["ihsg"] = ihsg;
        return;
      }
    }

    //add to histories
    histories.add({
      "month": date.month,
      "year": date.year,
      "yield": yield,
      "ihsg": ihsg,
    });
  }
}
