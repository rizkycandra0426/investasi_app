import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/portofolio_beli_service.dart';
import 'package:hyper_ui/service/portofolio_jual_service.dart';
import '../view/history_transaksi_view.dart';

class HistoryTransaksiController extends State<HistoryTransaksiView> {
  static late HistoryTransaksiController instance;
  late HistoryTransaksiView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getData();
  }

  @override
  void dispose() => super.dispose();

  bool loading = true;
  List histories = [];
  getData() async {
    loading = true;
    setState(() {});

    var beliResponse = await PortofolioBeliService().get(param: {
      "emiten": widget.emiten,
    });
    var jualResponse = await PortofolioJualService().get(param: {
      "emiten": widget.emiten,
    });

    var beliData = beliResponse["data"];
    var jualData = jualResponse["data"];

    for (var item in beliData) {
      //-----
      histories.add(item);
    }

    for (var item in jualData) {
      //-----
      histories.add(item);
    }

    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
