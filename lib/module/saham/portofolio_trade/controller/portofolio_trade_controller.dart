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
    price = TRX.getSahamLastCurrentPrice(widget.namaSaham);

    if (widget.sellMode) {
      volume = TRX.getSisaVolumeOfSaham(widget.namaSaham);
    }

    if (!widget.sellMode) {
      price = 0;
    }

    if (widget.editMode) {
      date = widget.editItem!.date;
      price = widget.editItem!.price;
      volume = widget.editItem!.qty;
      sekuritas = widget.editItem!.sekuritas;
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
      if (widget.editMode) {
        TRX.historyList.value.removeWhere((i) => i == widget.editItem);
      }

      TRX.sell(
        date: date,
        qty: volume,
        price: price,
        currentPrice: price,
        saham: widget.namaSaham,
        sekuritas: sekuritas,
      );
    } else {
      //buy mode
      if (widget.editMode) {
        TRX.historyList.value.removeWhere((i) => i == widget.editItem);
      }

      TRX.buy(
        date: date,
        qty: volume,
        price: price,
        currentPrice: price,
        saham: widget.namaSaham,
        sekuritas: sekuritas,
      );
    }

    PortofolioNewController.instance.reload();

    Get.back();
    ss(widget.sellMode ? "Sell success" : "Buy success");
  }

  bool loading = false;
  useRealtimePrice() async {
    try {
      loading = true;
      setState(() {});

      var newPrice = await StockNewService.getRealtimePrice(widget.namaSaham);
      price = newPrice;
      loading = false;
      setState(() {});
    } on Exception catch (_) {
      loading = false;
      setState(() {});
    }
  }
}
