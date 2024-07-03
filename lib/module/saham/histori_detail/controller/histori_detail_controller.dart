
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/histori_detail_view.dart';

class HistoriDetailController extends State<HistoriDetailView> {
  static late HistoriDetailController instance;
  late HistoriDetailView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
    