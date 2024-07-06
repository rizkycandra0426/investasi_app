
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/histori_dana_controller.dart';

class HistoriDanaView extends StatefulWidget {
  const HistoriDanaView({Key? key}) : super(key: key);

  Widget build(context, HistoriDanaController controller) {
  controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HistoriDana"),
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
  State<HistoriDanaView> createState() => HistoriDanaController();
}
    