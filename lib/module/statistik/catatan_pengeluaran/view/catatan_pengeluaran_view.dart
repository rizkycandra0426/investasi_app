import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class CatatanPengeluaranView extends StatefulWidget {
  CatatanPengeluaranView({Key? key}) : super(key: key);

  Widget build(context, CatatanPengeluaranController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              QTextField(
                label: "Deskripsi",
                validator: Validator.required,
                value: controller.deskripsi,
                onChanged: (value) {
                  controller.deskripsi = value;
                },
              ),
              QTextField(
                label: "Jumlah",
                validator: Validator.required,
                value: controller.amount.toString(),
                onChanged: (value) {
                  controller.amount = double.tryParse(value) ?? 0;
                },
              ),
              QButton(
                label: "Catat",
                onPressed: () => controller.create(),
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.items.length,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.items[index];
                  return QDismissible(
                    onDismiss: () {
                      controller.delete(item);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item["deskripsi"],
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Text(
                            "${NumberFormat().format(item["amount"])}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CatatanPengeluaranView> createState() => CatatanPengeluaranController();
}
