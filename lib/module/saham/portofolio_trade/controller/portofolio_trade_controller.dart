import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/portofolio_trade_view.dart';

class PortofolioTradeController extends State<PortofolioTradeView> {
  static late PortofolioTradeController instance;
  late PortofolioTradeView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    price = widget.item["current_price"];
    if (widget.sellMode) {
      sekuritas = widget.item["sekuritas"];
    }

    if (widget.sellMode) {
      // volume = widget.item["volume"];
    }
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  double price = 0;
  int volume = 1;
  DateTime date = DateTime.now();
  String sekuritas = "Ajaib";
  double get total {
    return price * volume;
  }

  reload() {
    setState(() {});
  }

  trade() {
    if (widget.sellMode) {
      //sell mode
      int newSellVolume = (widget.item["sell_volume"] ?? 0) + volume;
      int sisaVolume = widget.item["buy_volume"] - newSellVolume;
      if (sisaVolume < 0) {
        se("Volume sell melebihi volume saham");
        return;
      }
      widget.item["sell_volume"] = newSellVolume;
      widget.item["sell_price"] = price;
      widget.item["current_total"] = widget.item["sell_volume"] * price;
      widget.item["sekuritas"] = sekuritas;
      calculateTotal();
      StockNewService.sell(
        idSaham: widget.item["id_saham"],
        volume: volume.toDouble(),
        price: price,
        stock: widget.item,
      );
    } else {
      //buy mode
      widget.item["buy_volume"] = (widget.item["buy_volume"] ?? 0) + volume;
      widget.item["buy_price"] = price;
      widget.item["buy_total"] = widget.item["buy_volume"] * price;
      calculateTotal();
      StockNewService.buy(
        idSaham: widget.item["id_saham"],
        volume: volume.toDouble(),
        price: price,
        stock: widget.item,
      );
    }

    Get.back();
    ss(widget.sellMode ? "Sell success" : "Buy success");
  }

  calculateTotal() {
    if (widget.sellMode) {
      widget.item["current_price"] = price;
    }

    if (sekuritas != "-") {
      widget.item["sekuritas"] = sekuritas;
    }

    widget.item["current_price"] = price;
    StockNewService.calculate();
  }
}
