import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/histori_tahunan_detail_view.dart';

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
      yield: StockNewService.yieldInPercent,
      ihsg: StockNewService.ihsg,
    );
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
