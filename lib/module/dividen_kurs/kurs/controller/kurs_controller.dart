import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/kurs_view.dart';

class KursController extends State<KursView> {
  static late KursController instance;
  late KursView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
