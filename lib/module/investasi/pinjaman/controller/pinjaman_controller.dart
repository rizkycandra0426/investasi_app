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

  bool isPinjaman = true;
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
