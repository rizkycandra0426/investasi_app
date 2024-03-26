import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/portofolio_controller.dart';

class PortofolioView extends StatefulWidget {
  const PortofolioView({Key? key}) : super(key: key);

  Widget build(context, PortofolioController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portofolio"),
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
  State<PortofolioView> createState() => PortofolioController();
}
