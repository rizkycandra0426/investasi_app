import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/bulanan_investasi_view.dart';

class BulananInvestasiController extends State<BulananInvestasiView> {
  static late BulananInvestasiController instance;
  late BulananInvestasiView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool isBulanan = true;
  bool isButtonPressed = false;
  bool isContainerVisible = true;

  void buttonPressed() {
    setState(() {
      isButtonPressed = true;
    });
  }

  void toggleContainerVisibility() {
    setState(() {
      isButtonPressed = !isButtonPressed; // Membalikkan status isButtonPressed
    });
  }
}
