import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/splash_screen_view.dart';

class SplashScreenController extends State<SplashScreenView> {
  static late SplashScreenController instance;
  late SplashScreenView view;

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
