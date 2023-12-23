import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/statistik_pengeluaran_view.dart';

class StatistikPengeluaranController extends State<StatistikPengeluaranView> {
  static late StatistikPengeluaranController instance;
  late StatistikPengeluaranView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
