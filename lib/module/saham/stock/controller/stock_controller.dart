import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/stock_service.dart';
import '../view/stock_view.dart';

class StockController extends State<StockView> {
  static late StockController instance;
  late StockView view;
  // RxString searchQuery = ''.obs;

  @override
  void initState() {
    instance = this;
    super.initState();
    getData();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  // void updateSearchQuery(String query) {
  //   searchQuery.value = query;
  // }

  bool loading = false;
  List items = [];
  getData() async {
    Map<String, dynamic> response = await StockService().get();
    print(response);
    items = response["data"];
    setState(() {});
  }
}
