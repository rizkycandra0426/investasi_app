import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/topup_controller.dart';

class TopupView extends StatefulWidget {
  final bool topupMode;
  const TopupView({
    Key? key,
    this.topupMode = true,
  }) : super(key: key);

  Widget build(context, TopupController controller) {
    controller.view = this;
    var dashboardController = DashboardController.instance;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: controller.isTopupMode ? Colors.blue : Colors.red,
        title: Text(controller.isTopupMode ? "Topup" : "Withdraw"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QNumberField(
                key: UniqueKey(),
                label: "Amount",
                validator: Validator.required,
                value: controller.amount.toString(),
                onChanged: (value) {
                  controller.amount = double.tryParse(value) ?? 0.0;
                },
              ),
              QCategoryPicker(
                items: List.generate(5, (index) {
                  var value = 100000000 * (index + 1);
                  return {
                    "label": "${value.currency}",
                    "value": value,
                  };
                }),
                validator: Validator.required,
                onChanged: (index, label, value, item) {
                  controller.amount = double.tryParse("$value") ?? 0;
                  controller.reload();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        color: controller.isTopupMode ? Colors.blue : Colors.red,
        onPressed: () => controller.process(),
      ),
    );
  }

  @override
  State<TopupView> createState() => TopupController();
}
