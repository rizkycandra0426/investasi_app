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
  int? year = null;
  updateYear(int value) {
    year = value;
    setState(() {});
  }

  List yields = [];
  double getYieldByMonth(String month, int year) {
    for (var element in yields) {
      var mmm = DateFormat("MMMM").format(DateTime.parse(element["date"]));
      print("$mmm == $month");
      if (DateFormat("MMMM")
                  .format(DateTime.parse(element["date"]))
                  .toString() ==
              month.toString() &&
          DateTime.parse(element["date"]).year == year) {
        return element["yield"] * 1.0;
      }
    }

    return 0;
  }

  getData() async {
    var responseYield = await Dio().get(
      "$baseUrl/v2/yield",
    );
    yields = responseYield.data;

    //---------------
    //---------------

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

    return current.first["yield_ihsg"] ?? 0;

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
        yields.where((i) => DateTime.parse(i["date"]).year == year).toList();

    return current.last["yield"] ?? 0;
  }
}
