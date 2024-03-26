import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/saham_controller.dart';

class SahamView extends StatefulWidget {
  const SahamView({Key? key}) : super(key: key);

  Widget build(context, SahamController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saham"),
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
  State<SahamView> createState() => SahamController();
}
