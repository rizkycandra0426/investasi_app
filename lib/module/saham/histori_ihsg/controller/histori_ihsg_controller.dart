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
    setState(() {});
  }

  int selectedYear = now.year;
  updateSelectedYear(int value) {
    selectedYear = value;
    setState(() {});
  }
}
