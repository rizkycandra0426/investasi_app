import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/portofolio_edit_price_view.dart';

class PortofolioEditPriceController extends State<PortofolioEditPriceView> {
  static late PortofolioEditPriceController instance;
  late PortofolioEditPriceView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());

    var tradeHistories = StockNewService.tradeHistories
        .where((i) => i["id_saham"] == widget.item["id_saham"])
        .toList();

    double currentPrice = 0;

    if (tradeHistories.isNotEmpty) {
      currentPrice = tradeHistories.last["current_price"];
    }
    price = currentPrice;
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  double price = 0;
  save() {
    widget.item["current_price"] = price;

    var histories = StockNewService.tradeHistories
        .where((i) => i["id_saham"] == widget.item["id_saham"])
        .toList();
    histories.last["current_price"] = price;

    StockNewService.calculate();
    Get.back();
  }

  bool loading = false;
  useRealtimePrice() async {
    try {
      loading = true;
      setState(() {});

      var newPrice =
          await StockNewService.getRealtimePrice(widget.item["nama_saham"]);
      price = newPrice;
      loading = false;
      setState(() {});
    } on Exception catch (_) {
      loading = false;
      setState(() {});
    }
  }
}
