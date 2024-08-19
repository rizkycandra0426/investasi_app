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

    var loadingWidget = Center(
      child: Text("Load realtime data..."),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buyMode ? Colors.green : Colors.red,
        title: Text("Trade - ${buyMode ? "Buy" : "Sell"}"),
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
                      label: "Price",
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
                    const SizedBox(
                      height: 12.0,
                    ),
                    QDatePicker(
                      label: "Date",
                      validator: Validator.required,
                      value: controller.date,
                      onChanged: (value) {
                        print("value: $value");
                        controller.date = value;
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
                        },
                        {
                          "label": "Stockbit",
                          "value": "Stockbit",
                        },
                        {
                          "label": "IPOT",
                          "value": "IPOT",
                        },
                        {
                          "label": "RTI Business",
                          "value": "RTI Business",
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
      bottomNavigationBar: controller.loading
          ? null
          : QActionButton(
              color: buyMode ? Colors.green : Colors.red,
              label: buyMode ? "Buy" : "Sell",
              onPressed: () => controller.trade(),
            ),
    );
  }

  @override
  State<PortofolioTradeView> createState() => PortofolioTradeController();
}
