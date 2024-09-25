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
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  reload() {
    if (mounted) setState(() {});
  }

  int selectedYear = now.year;
  updateSelectedYear(int value) {
    selectedYear = value;
    setState(() {});
  }

  int mode = 0;
  updateMode(int value) {
    mode = value;
    setState(() {});
  }

  Map yieldMaps = {};
  Map ihsgMaps = {};

  double getYieldTotalByYear(int year) {
    yieldMaps[year] = yieldMaps[year] ?? [];
    var total = 0.0;
    for (var item in yieldMaps[year]) {
      total += item;
    }
    return total;
  }

  double getIhsgTotalByYear(int year) {
    ihsgMaps[year] = ihsgMaps[year] ?? [];
    var total = 0.0;
    for (var item in ihsgMaps[year]) {
      total += item;
    }
    return total;
  }
}
