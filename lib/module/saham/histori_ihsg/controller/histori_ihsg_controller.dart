import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/histori_ihsg_view.dart';

class HistoriIhsgController extends State<HistoriIhsgView> {
  static late HistoriIhsgController instance;
  late HistoriIhsgView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    getData();
  }

  List items = [];
  getData() async {
    var response = await dio.get(
      "$baseUrl/v2/ihsg",
    );
    items = response.data;
    setState(() {});
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  double getIhsg(int year) {
    var current =
        items.where((i) => DateTime.parse(i["date"]).year == year).toList();

    var total = 0.0;
    var count = 0;

    for (var item in current) {
      total += item["yield_ihsg"] ?? 0.0;
      count++;
    }

    var average = total / count;
    return average;
  }

  double getYield(int year) {
    var current =
        items.where((i) => DateTime.parse(i["date"]).year == year).toList();

    var total = 0.0;
    var count = 0;

    for (var item in current) {
      total += item["yield_ihsg"] ?? 0.0;
      count++;
    }

    var average = total / count;
    return average;
  }
}
