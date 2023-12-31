import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/pinjaman_view.dart';

class PinjamanController extends State<PinjamanView> {
  static late PinjamanController instance;
  late PinjamanView view;

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
