import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/portofolio_edit_price_controller.dart';

class PortofolioEditPriceView extends StatefulWidget {
  final Map<String, dynamic> item;
  const PortofolioEditPriceView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, PortofolioEditPriceController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Edit current price"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QNumberField(
                label: "Current Price",
                validator: Validator.required,
                value: controller.price.toString(),
                onChanged: (value) {
                  controller.price = double.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: QActionButton(
        color: Colors.blue,
        label: "Save",
        onPressed: () => controller.save(),
      ),
    );
  }

  @override
  State<PortofolioEditPriceView> createState() =>
      PortofolioEditPriceController();
}
