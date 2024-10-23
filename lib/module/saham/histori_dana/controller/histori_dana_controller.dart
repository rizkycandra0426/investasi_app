import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class HistoriDanaController extends State<HistoriDanaView> {
  static late HistoriDanaController instance;
  late HistoriDanaView view;

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

  double get totalJumlahUnit {
    var histories = TRX.danaHistories;
    return histories.fold(0.0, (prev, e) {
      if (e.total < 0) {
        return prev - e.jumlahUnit;
      }
      return prev + e.jumlahUnit;
    });
  }
}
