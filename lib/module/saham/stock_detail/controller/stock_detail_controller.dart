import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/stock_detail_view.dart';

class StockDetailController extends State<StockDetailView> {
  static late StockDetailController instance;
  late StockDetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
