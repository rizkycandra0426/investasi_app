import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/anggaran_pengeluaran_view.dart';

class AnggaranPengeluaranController extends State<AnggaranPengeluaranView> {
  static late AnggaranPengeluaranController instance;
  late AnggaranPengeluaranView view;

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
