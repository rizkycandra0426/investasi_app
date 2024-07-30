import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/stock_data.dart';

class StockNewService {
  static List stocks = [];
  static List tradeHistories = [];
  static double costTotal = 0.0;
  static double valuationTotal = 0.0;
  static double valuationTotalByBuyValue = 0.0;
  static double ihsgStart = 0.0;
  static double ihsgEnd = 0.0;
  static double get ihsg {
    return (ihsgEnd - ihsgStart) / ihsgStart;
  }

  static double get jumlahPerUnit {
    return currentUserSaldo / 1000;
  }

  static calculate() {
    costTotal = 0;
    valuationTotal = 0;
    valuationTotalByBuyValue = 0;

    for (var stock in stocks) {
      var currentVolume = stock["buy_volume"] - stock["sell_volume"];
      stock["valuation"] = currentVolume * stock["current_price"];
      stock["floating_return"] = stock["valuation"] - stock["buy_total"];

      costTotal = costTotal + (stock["buy_volume"] * stock["buy_price"]);
      valuationTotal = valuationTotal + (stock["valuation"] ?? 0);

      //---------------------------
      //---------------------------
    }

    // for (var stock in stocks) {
    //   costTotal = costTotal + (stock["buy_volume"] * stock["buy_price"]);
    //   valuationTotal = valuationTotal + (stock["valuation"] ?? 0);
    // }

    for (var stock in stocks) {
      var currentVolume = (stock["buy_volume"] - stock["sell_volume"]);
      var buyTotal = currentVolume * stock["buy_price"];
      stock["fund_alloc"] =
          (buyTotal / (UserBalanceService.sisaSaldo + costTotal));
      stock["value_effect"] = (stock["valuation"] /
          (UserBalanceService.sisaSaldo + valuationTotal));

      var buyValueValuation = stock["buy_volume"] * stock["current_price"];
      valuationTotalByBuyValue =
          valuationTotalByBuyValue + (buyValueValuation ?? 0);
    }

    print("costTotal: $costTotal");
    print("valuationTotal: $valuationTotal");
    print("valuationTotalByBuyValue: $valuationTotalByBuyValue");
  }

  static initialize() async {
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

  static void buy({
    required String idSaham,
    required double volume,
    required double price,
    required Map stock,
  }) {
    String namaSaham = stocks
        .where((element) => element["id_saham"] == idSaham)
        .first["nama_saham"];
    tradeHistories.add({
      "date": DateTime.now().toString(),
      "id_saham": idSaham,
      "nama_saham": namaSaham,
      "volume": volume,
      "price": price,
      "total": volume * price,
      "action": "BUY",
      "stock": stock,
    });
  }

  static void sell({
    required String idSaham,
    required double volume,
    required double price,
    required Map stock,
  }) {
    //harga saat ini, valuation
    String namaSaham = stocks
        .where((element) => element["id_saham"] == idSaham)
        .first["nama_saham"];
    tradeHistories.add({
      "date": DateTime.now().toString(),
      "id_saham": idSaham,
      "nama_saham": namaSaham,
      "volume": volume,
      "price": price,
      "total": volume * price,
      "action": "SELL",
      "stock": stock,
    });
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

  static topup(double amount) {
    double hargaUnit = 0;
    double jumlahUnit = 0;
    if (topupHistories.isEmpty) {
      //first time topup
      hargaUnit = 1000;
      jumlahUnit = amount / 1000;
    } else {
      //after first time topup
      hargaUnit = hargaUnitSaatIni;
      jumlahUnit = amount / hargaUnit;
    }

    topupHistories.add({
      "date": DateTime.now().toString(),
      "amount": amount,
      "harga_unit": hargaUnit,
      "jumlah_unit": jumlahUnit,
    });
  }

  static withdraw(double amount) {
    double hargaUnit = hargaUnitSaatIni;
    topupHistories.add({
      "date": DateTime.now().toString(),
      "amount": -amount,
      "harga_unit": hargaUnit,
      "jumlah_unit": -amount / hargaUnitSaatIni,
    });
  }

  static double get jumlahUnit {
    double jumlah = 0;
    for (var history in topupHistories) {
      jumlah = jumlah + history["jumlah_unit"];
    }
    return jumlah;
  }

  static double get hargaUnitSaatIni {
    if (StockNewService.valuationTotal == 0) return 1000;
    return (sisaSaldo + StockNewService.valuationTotalByBuyValue) / jumlahUnit;
  }

  static double get sisaSaldo {
    return UserBalanceService.saldo - StockNewService.costTotal;
  }

  static double get sisaSaldoPlusSellValuation {
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
