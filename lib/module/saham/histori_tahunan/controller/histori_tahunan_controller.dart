
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/histori_tahunan_view.dart';

class HistoriTahunanController extends State<HistoriTahunanView> {
  static late HistoriTahunanController instance;
  late HistoriTahunanView view;

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
    