import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/histori_tahunan_view.dart';

class HistoriTahunanController extends State<HistoriTahunanView> {
  static late HistoriTahunanController instance;
  late HistoriTahunanView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    getBulkData();
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  List results = [];
  String ihsg = "";
  String portoYield = "";
  bool loading = true;
  Map porto = {};
  List items = [];

  getBulkData() async {
    loading = true;
    setState(() {});

    for (var i = 2024; i <= now.year; i++) {
      await getData(i);
    }

    items = items.reversed.toList();

    loading = false;
    setState(() {});
  }

  getData(int year) async {
    //TODO: IHSG by YEAR?
    var response1 = await IhsgService().get(param: {
      "year": year,
    });
    ihsg = response1["data"]["ihsg"];

    var response2 = await PortoService().get(param: {
      "year": year,
    });
    results = response2["result"];
    portoYield = response2["porto"]["yield"];
    porto = response2["porto"];
    print("---");

    //----------------------
    var equity = 0.0;
    var floatingReturn = 0.0;
    for (var item in results) {
      equity += item["equity"];
      floatingReturn += item["return"];
    }
    //----------------------

    items.add({
      "year": year,
      "equity": equity,
      "harga_per_unit": porto["harga_unit"],
      "jumlah_per_unit": porto["jumlah_unit_penyertaan"],
      "floating_return": floatingReturn,
      "yield": portoYield,
      "ihsg": ihsg,
    });
  }

  double get floatingReturn {
    var total = 0.0;
    for (var item in results) {
      total += item["return"];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
