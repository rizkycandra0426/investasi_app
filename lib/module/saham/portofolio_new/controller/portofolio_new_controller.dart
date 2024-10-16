import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PortofolioNewController extends State<PortofolioNewView> {
  static late PortofolioNewController instance;
  late PortofolioNewView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    StockNewService.calculate();
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  reload() {
    if (mounted) setState(() {});
  }
}

reloadPortofolio() async {
  OfflineService.saveLocalValues();
  await StockNewService.calculate();
  await Future.delayed(Duration(milliseconds: 300));

  PortofolioNewController.instance.reload();
  await Future.delayed(Duration(milliseconds: 300));

  StockListController.instance.reload();
}
