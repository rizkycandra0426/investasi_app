import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/about_us_view.dart';

class AboutUsController extends State<AboutUsView> {
  static late AboutUsController instance;
  late AboutUsView view;

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
