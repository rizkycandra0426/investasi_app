import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/portofolio_edit_price_controller.dart';

class PortofolioEditPriceView extends StatefulWidget {
  final History item;
  const PortofolioEditPriceView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, PortofolioEditPriceController controller) {
    controller.view = this;

    var loadingWidget = Center(
      child: Text("Load realtime data..."),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Edit current price"),
        actions: const [],
      ),
      body: controller.loading
          ? loadingWidget
          : SingleChildScrollView(
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
                    QButton(
                      label: "Use Realtime Price",
                      color: Colors.grey,
                      onPressed: () => controller.useRealtimePrice(),
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
