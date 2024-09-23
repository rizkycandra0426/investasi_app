import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/trade_histoy_view.dart';

class TradeHistoyController extends State<TradeHistoyView> {
  static late TradeHistoyController instance;
  late TradeHistoyView view;

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

  reload() {
    setState(() {});
  }
}
