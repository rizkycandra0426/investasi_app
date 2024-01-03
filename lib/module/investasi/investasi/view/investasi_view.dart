import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/investasi_controller.dart';

class InvestasiView extends StatefulWidget {
  const InvestasiView({Key? key}) : super(key: key);

  Widget build(context, InvestasiController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Investasi"),
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
  State<InvestasiView> createState() => InvestasiController();
}
