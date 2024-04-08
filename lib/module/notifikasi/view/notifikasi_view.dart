import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/notifikasi_controller.dart';

class NotifikasiView extends StatefulWidget {
  const NotifikasiView({Key? key}) : super(key: key);

  Widget build(context, NotifikasiController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifikasi"),
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
  State<NotifikasiView> createState() => NotifikasiController();
}
