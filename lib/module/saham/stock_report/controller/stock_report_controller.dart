import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/stock_report_view.dart';

class StockReportController extends State<StockReportView> {
  static late StockReportController instance;
  late StockReportView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
