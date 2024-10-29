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
              QButton(
                label: "Buat catatan",
                onPressed: () async {
                  showCustomDialog(
                    title: "Buat catatan",
                    children: [
                      QTextField(
                        label: "Title",
                        validator: Validator.required,
                        onChanged: (value) {
                          controller.title = value;
                        },
                      ),
                      QMemoField(
                        label: "Note",
                        validator: Validator.required,
                        onChanged: (value) {
                          controller.note = value;
                        },
                      ),
                      QButton(
                        label: "Catat",
                        onPressed: () => controller.create(),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.items.length,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.items[index];
                  if (item["year"] !=
                      StatistikDashboardController.instance.currentDate.year)
                    return Container();
                  if (item["month"] !=
                      StatistikDashboardController.instance.currentDate.month)
                    return Container();
                  return QDismissible(
                    onDismiss: () {
                      controller.delete(item);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffffd145),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"] ?? "-",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            item["note"] ?? "-",
                            style: const TextStyle(
                              fontSize: 14.0,
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
