import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/investasi_view.dart';

class InvestasiController extends State<InvestasiView> {
  static late InvestasiController instance;
  late InvestasiView view;

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
