import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/stock_report_controller.dart';

class StockReportView extends StatefulWidget {
  const StockReportView({super.key});

  Widget build(context, StockReportController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<StockReportView> createState() => StockReportController();
}
