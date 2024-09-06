import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/buy_deposito_controller.dart';

class BuyDepositoView extends StatefulWidget {
  const BuyDepositoView({super.key});

  Widget build(context, BuyDepositoController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy Deposito"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                QNumberField(
                  label: "Amount",
                  validator: Validator.required,
                  value: controller.amount.toString(),
                  onChanged: (value) {
                    controller.amount = double.tryParse(value) ?? 0;
                  },
                ),
                QTextField(
                  label: "Nama Bank",
                  validator: Validator.required,
                  value: controller.namaBank,
                  onChanged: (value) {
                    controller.namaBank = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () => controller.save(),
      ),
    );
  }

  @override
  State<BuyDepositoView> createState() => BuyDepositoController();
}
