import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/dividen_service.dart';
import '../view/dividen_view.dart';

class DividenController extends State<DividenView> {
  static late DividenController instance;
  late DividenView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    loadData();
  }

  List items = [];
  loadData() async {
    var response = await DividenService().get();
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
