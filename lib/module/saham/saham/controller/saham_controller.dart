import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class SahamController extends State<SahamView> {
  static late SahamController instance;
  late SahamView view;

  @override
  void initState() {
    instance = this;
    StockNewService.initialize();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool loading = false;
  void reload() async {
    loading = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 1));

    loading = false;
    setState(() {});
  }
}
