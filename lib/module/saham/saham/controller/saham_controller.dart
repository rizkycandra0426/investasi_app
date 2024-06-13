import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/stock_service.dart';
import '../view/saham_view.dart';

class SahamController extends State<SahamView> {
  static late SahamController instance;
  late SahamView view;

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
