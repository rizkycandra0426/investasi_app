import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/history_transaksi_view.dart';

class HistoryTransaksiController extends State<HistoryTransaksiView> {
  static late HistoryTransaksiController instance;
  late HistoryTransaksiView view;

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
