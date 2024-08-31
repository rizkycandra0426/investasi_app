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
    price = TRX.getSahamLastCurrentPrice(widget.item.target);

    if (widget.sellMode) {
      volume = TRX.getSisaVolumeOfSaham(widget.item.target);
    }

    if (!widget.sellMode) {
      price = 0;
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

  trade() async {
    if (widget.sellMode) {
      //sell mode
      TRX.sell(
        date: date,
        qty: volume,
        price: price,
        currentPrice: price,
        saham: widget.item.target,
      );
    } else {
      //buy mode
      TRX.buy(
        date: date,
        qty: volume,
        price: price,
        currentPrice: price,
        saham: widget.item.target,
      );
    }

    Get.back();
    ss(widget.sellMode ? "Sell success" : "Buy success");
  }

  bool loading = false;
  useRealtimePrice() async {
    try {
      loading = true;
      setState(() {});

      var newPrice = await StockNewService.getRealtimePrice(widget.item.target);
      price = newPrice;
      loading = false;
      setState(() {});
    } on Exception catch (_) {
      loading = false;
      setState(() {});
    }
  }
}
