import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class TopupView extends StatefulWidget {
  final bool topupMode;
  const TopupView({
    Key? key,
    this.topupMode = true,
  }) : super(key: key);

  Widget build(context, TopupController controller) {
    controller.view = this;
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
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    if (controller.isTopupMode)
                      QRadioField(
                        label: "Jenis Topup",
                        validator: Validator.atLeastOneitem,
                        items: [
                          {
                            "label": "Topup Dana",
                            "value": "Topup Dana",
                          },
                          {
                            "label": "Topup Deviden Saham",
                            "value": "Topup Deviden Saham",
                          },
                          {
                            "label": "Topup Deviden Deposito",
                            "value": "Topup Deviden Deposito",
                          }
                        ],
                        value: controller.jenisTopup,
                        onChanged: (value, label) {
                          controller.jenisTopup = value;
                          controller.reload();
                        },
                      ),
                    if (controller.jenisTopup == "Topup Deviden Saham")
                      Builder(builder: (context) {
                        List<Map<String, dynamic>> items = [];

                        TRX.portofolioSaham.forEach((element) {
                          items.add({
                            "label": element.target,
                            "value": element.target,
                          });
                        });
                        return QDropdownField(
                          label: "Saham",
                          validator: Validator.required,
                          items: items,
                          onChanged: (value, label) {
                            controller.saham = value;
                          },
                        );
                      }),
                    if (controller.jenisTopup == "Topup Deviden Deposito")
                      Builder(builder: (context) {
                        var items = TRX.getUniqueNamaBankList();
                        return QDropdownField(
                          label: "Nama Bank",
                          validator: Validator.required,
                          items: items,
                          onChanged: (value, label) {
                            controller.namaBank = value;
                          },
                        );
                      }),
                    QNumberField(
                      key: UniqueKey(),
                      label: "Amount",
                      pattern: "#,###",
                      validator: (value) {
                        if ((int.tryParse(value.toString()) ?? 0) < 0) {
                          return "Amount must be greater than 0";
                        }
                        return Validator.required(value);
                      },
                      value: controller.amount.toString(),
                      onChanged: (value) {
                        controller.amount = double.tryParse(value) ?? 0.0;
                      },
                    ),
                  ],
                ),
              ),
              QCategoryPicker(
                items: List.generate(5, (index) {
                  var amount = 1000000;
                  if (index > 0) {
                    amount = 5000000 * index;
                  }
                  var value = amount;
                  return {
                    "label": "${value.numberk}",
                    "value": value,
                  };
                }),
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
