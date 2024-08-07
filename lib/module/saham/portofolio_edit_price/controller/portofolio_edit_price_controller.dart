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
    price = widget.item["current_price"];
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
