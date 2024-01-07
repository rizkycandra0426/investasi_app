import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/bulanan_investasi_controller.dart';

class BulananInvestasiView extends StatefulWidget {
  const BulananInvestasiView({Key? key}) : super(key: key);

  Widget build(context, BulananInvestasiController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("BulananInvestasi"),
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
  State<BulananInvestasiView> createState() => BulananInvestasiController();
}
