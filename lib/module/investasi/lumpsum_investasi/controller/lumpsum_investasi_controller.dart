import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/lumpsum_investasi_view.dart';

class LumpsumInvestasiController extends State<LumpsumInvestasiView> {
  static late LumpsumInvestasiController instance;
  late LumpsumInvestasiView view;

  set memo(String memo) {}

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool isLumpsum = true;
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
