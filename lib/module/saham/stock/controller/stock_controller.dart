import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/stock_view.dart';

class StockController extends State<StockView> {
  static late StockController instance;
  late StockView view;
  // RxString searchQuery = ''.obs;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  // void updateSearchQuery(String query) {
  //   searchQuery.value = query;
  // }
}
