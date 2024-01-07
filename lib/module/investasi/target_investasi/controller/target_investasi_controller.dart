import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/target_investasi_view.dart';

class TargetInvestasiController extends State<TargetInvestasiView> {
  static late TargetInvestasiController instance;
  late TargetInvestasiView view;

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
