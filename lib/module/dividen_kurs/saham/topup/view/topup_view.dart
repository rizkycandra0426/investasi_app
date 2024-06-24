import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/topup_controller.dart';

class TopupView extends StatefulWidget {
  const TopupView({Key? key}) : super(key: key);

  Widget build(context, TopupController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Topup"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QNumberField(
                label: "Amount",
                validator: Validator.required,
                value: controller.amount.toString(),
                onChanged: (value) {
                  controller.amount = double.tryParse(value) ?? 0.0;
                },
              ),
              AbsorbPointer(
                child: QTextField(
                  label: "Catatan",
                  validator: Validator.required,
                  value: controller.catatan,
                  onChanged: (value) {
                    controller.catatan = value;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: QActionButton(
        label: "Topup",
        onPressed: () => controller.topup(),
      ),
    );
  }

  @override
  State<TopupView> createState() => TopupController();
}
