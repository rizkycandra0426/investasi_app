import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/stock_detail_controller.dart';

class StockDetailView extends StatefulWidget {
  const StockDetailView({Key? key}) : super(key: key);

  Widget build(context, StockDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("StockDetail"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<StockDetailView> createState() => StockDetailController();
}
