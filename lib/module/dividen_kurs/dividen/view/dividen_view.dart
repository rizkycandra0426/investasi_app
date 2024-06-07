import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/dividen_controller.dart';

class DividenView extends StatefulWidget {
  const DividenView({Key? key}) : super(key: key);

  Widget build(context, DividenController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dividen"),
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
  State<DividenView> createState() => DividenController();
}
