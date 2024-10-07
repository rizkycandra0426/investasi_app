import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class KursController extends State<KursView> {
  static late KursController instance;
  late KursView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    loadData();
  }

  List items = [];
  loadData() async {
    var response = await KursService().get();
    items = response["data"];
    setState(() {});
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
