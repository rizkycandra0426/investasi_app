import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/histori_ihsg_view.dart';

class HistoriIhsgController extends State<HistoriIhsgView> {
  static late HistoriIhsgController instance;
  late HistoriIhsgView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    getData();
  }

  List items = [];
  getData() async {
    var response = await dio.get(
      "$baseUrl/v2/ihsg",
    );
    items = response.data;
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
