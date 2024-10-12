import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/debug_user_view.dart';

class DebugUserController extends State<DebugUserView> {
  static late DebugUserController instance;
  late DebugUserView view;

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
