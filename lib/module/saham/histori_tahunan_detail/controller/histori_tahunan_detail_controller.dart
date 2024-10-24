import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class HistoriTahunanDetailController extends State<HistoriTahunanDetailView> {
  static late HistoriTahunanDetailController instance;
  late HistoriTahunanDetailView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    LocalIHSGService.insertOrUpdate(
      date: now,
      yield: StockNewService.getYieldInPercent(now.year),
      ihsg: StockNewService.ihsg,
    );

    // Future.delayed(Duration(seconds: 1), () {
    //   print(HistoriIhsgController.instance.yieldMaps);
    //   print(HistoriIhsgController.instance.ihsgMaps);
    //   HistoriIhsgController.instance.reload();
    // });
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
