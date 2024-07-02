import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/ihsg_service.dart';
import 'package:hyper_ui/service/porto_service.dart';
import '../view/portofolio_view.dart';

class PortofolioController extends State<PortofolioView> {
  static late PortofolioController instance;
  late PortofolioView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getData();
  }

  List results = [];
  String ihsg = "";
  String portoYield = "";
  bool loading = true;
  getData() async {
    loading = true;
    setState(() {});

    var response1 = await IhsgService().get();
    ihsg = response1["data"]["ihsg"];

    var response2 = await PortoService().get();
    results = response2["result"];
    portoYield = response2["porto"]["yield"];
    print("---");

    loading = false;
    setState(() {});
    ProfileController.instance.refresh();
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
