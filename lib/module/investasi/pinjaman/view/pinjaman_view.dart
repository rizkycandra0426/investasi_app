import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/pinjaman_controller.dart';

class PinjamanView extends StatefulWidget {
  const PinjamanView({Key? key}) : super(key: key);

  Widget build(context, PinjamanController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pinjaman"),
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
  State<PinjamanView> createState() => PinjamanController();
}
