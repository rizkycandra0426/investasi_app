import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PortofolioEditPriceController extends State<PortofolioEditPriceView> {
  static late PortofolioEditPriceController instance;
  late PortofolioEditPriceView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());

    double currentPrice = TRX.getSahamLastCurrentPrice(widget.item.target);
    price = currentPrice;
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  double realtimePrice = 0;
  double price = 0;
  save() async {
    showLoading();
    var recordIndex =
        TRX.updateCurrentPriceOfLastSaham(widget.item.target, price);
    await Future.delayed(Duration(seconds: 1));

    TRX.disableCalculate = false;
    TRX.sortByDateAndRecalculate();
    TRX.disableCalculate = true;

    hideLoading();
    Get.back();

    PortofolioNewController.instance.reload();

    //START OF HOT Fix, yield issues
    TRX.topup(
      date: TRX.historyList.value[recordIndex].date.add(Duration(seconds: 1)),
      amount: 0,
      type: TopupType.devidenSaham,
      saham: widget.item.target,
    );
    PortofolioNewController.instance.reload();
    //#END
  }

  bool loading = false;
  useRealtimePrice() async {
    try {
      loading = true;
      price = realtimePrice;
      setState(() {});

      await Future.delayed(Duration(milliseconds: 1000));

      loading = false;
      setState(() {});
    } on Exception catch (_) {
      loading = false;
      setState(() {});
    }
  }
}
