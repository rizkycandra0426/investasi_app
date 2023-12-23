import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/catatan_pengeluaran_view.dart';

class CatatanPengeluaranController extends State<CatatanPengeluaranView> {
  static late CatatanPengeluaranController instance;
  late CatatanPengeluaranView view;

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
