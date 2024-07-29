import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/portofolio_trade_controller.dart';

class PortofolioTradeView extends StatefulWidget {
  final bool sellMode;
  final Map<String, dynamic> item;
  const PortofolioTradeView({
    Key? key,
    required this.item,
    this.sellMode = false,
  }) : super(key: key);

  Widget build(context, PortofolioTradeController controller) {
    controller.view = this;
    bool buyMode = !sellMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: buyMode ? Colors.green : Colors.red,
        title: const Text("PortofolioTrade"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QNumberField(
                label: "Price",
                validator: Validator.required,
                value: controller.price.toString(),
                onChanged: (value) {
                  controller.price = double.tryParse(value) ?? 0;
                },
              ),
              QDatePicker(
                label: "Date",
                validator: Validator.required,
                value: controller.date,
                onChanged: (value) {
                  print("value: $value");
                },
              ),
              QNumberField(
                label: "Volume",
                validator: Validator.required,
                value: controller.volume.toString(),
                onChanged: (value) {
                  controller.volume = int.tryParse(value) ?? 0;
                  controller.reload();
                },
              ),
              AbsorbPointer(
                child: QNumberField(
                  key: Key("${controller.volume}"),
                  label: "Total",
                  validator: Validator.required,
                  value: controller.total.toString(),
                  onChanged: (value) {},
                ),
              ),
              QDropdownField(
                label: "Sekuritas",
                validator: Validator.required,
                items: [
                  {
                    "label": "Ajaib",
                    "value": "Ajaib",
                  },
                  {
                    "label": "Bibit",
                    "value": "Bibit",
                  }
                ],
                value: controller.sekuritas,
                onChanged: (value, label) {
                  controller.sekuritas = value;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: QActionButton(
        color: buyMode ? Colors.green : Colors.red,
        label: buyMode ? "Buy" : "Sell",
        onPressed: () => controller.trade(),
      ),
    );
  }

  @override
  State<PortofolioTradeView> createState() => PortofolioTradeController();
}
