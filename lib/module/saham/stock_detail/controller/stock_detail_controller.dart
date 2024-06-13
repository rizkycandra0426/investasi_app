import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/stock_detail_response.dart';
import 'package:hyper_ui/service/stock_service.dart';
import '../view/stock_detail_view.dart';

class StockDetailController extends State<StockDetailView> {
  static late StockDetailController instance;
  late StockDetailView view;

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

  bool loading = false;
  StockDetailResponse? data;
  getData() async {
    data = await StockService().getDetail(
      widget.stock["symbol"],
    );
    setState(() {});
  }
}
