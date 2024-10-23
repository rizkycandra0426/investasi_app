import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

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
    var response1 = await IhsgService().get(param: {
      "year": year,
    });
    ihsg = response1["data"]["ihsg"];
    // ihsg = "2.41%";

    var response2 = await PortoService().get(param: {
      "year": year,
    });
    results = response2["result"];
    portoYield = double.tryParse(response2["porto"]["yield"].toString()) ?? 0.0;
    porto = response2["porto"];
    print("---");

    //----------------------
    double ihsgDouble = double.tryParse(ihsg.replaceAll("%", "")) ?? 0.0;
    // double portoYieldDouble = double.tryParse(portoYield.toString()) ?? 0.0;

    await dio.post(
      "$baseUrl/v2/ihsg",
      data: {
        "id": DateTime(now.year, now.month, 1).yMd,
        "date": DateTime(now.year, now.month, 1).yMd,
        "change": ihsgDouble,
        "last": 0.0,
        "open": 0.0,
        "high": 0.0,
        "low": 0.0,
        "vol": 0.0,
      },
    );
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
