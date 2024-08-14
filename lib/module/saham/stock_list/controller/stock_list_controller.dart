import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hyper_ui/core.dart';
import '../view/stock_list_view.dart';

class StockListController extends State<StockListView> {
  static late StockListController instance;
  late StockListView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    reload();
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  reload() {
    StockNewService.calculate();
    items.value = List<dynamic>.from(StockNewService.stocks);
    setState(() {});
  }

  String search = "";
  updateSearch(String value) {
    search = value;
    setState(() {});
  }

  ValueNotifier<List<dynamic>> items = ValueNotifier<List<dynamic>>([]);
}
