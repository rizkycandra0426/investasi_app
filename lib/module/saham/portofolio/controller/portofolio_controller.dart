import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/portofolio_view.dart';

class PortofolioController extends State<PortofolioView> {
  static late PortofolioController instance;
  late PortofolioView view;

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
