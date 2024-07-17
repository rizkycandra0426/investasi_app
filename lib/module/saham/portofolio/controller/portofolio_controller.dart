import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/ihsg_service.dart';
import 'package:hyper_ui/service/porto_service.dart';
import '../view/portofolio_view.dart';

class PortofolioController extends State<PortofolioView> {
  static late PortofolioController instance;
  late PortofolioView view;

  get equity => null;

  @override
  void initState() {
    instance = this;
    super.initState();
    getData(now.year);
  }

  List results = [];
  String ihsg = "";
  double portoYield = 0.0;
  double totalEquity = 0;
  bool loading = true;
  Map porto = {};
  List items = [];
  getData(int year) async {
    loading = true;
    setState(() {});

    print("get IHSG?");
    //TODO: IHSG by YEAR?
    var response1 = await IhsgService().get(param: {
      "year": year,
    });
    ihsg = response1["data"]["ihsg"];

    var response2 = await PortoService().get(param: {
      "year": year,
    });
    results = response2["result"];
    portoYield = double.tryParse(response2["porto"]["yield"].toString()) ?? 0.0;
    porto = response2["porto"];
    print("---");

    //----------------------
    var equity = 0.0;
    var floatingReturn = 0.0;
    for (var item in results) {
      equity += item["equity"]; 
      totalEquity += item["equity"];
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

    loading = false;
    setState(() {});
  }

  double get floatingReturn {
    var total = 0.0;
    for (var item in results) {
      total += item["return"];
    }
    return total;
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
