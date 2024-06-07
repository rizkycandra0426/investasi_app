import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/kurs_controller.dart';

class KursView extends StatefulWidget {
  const KursView({Key? key}) : super(key: key);

  Widget build(context, KursController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kurs"),
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
  State<KursView> createState() => KursController();
}
