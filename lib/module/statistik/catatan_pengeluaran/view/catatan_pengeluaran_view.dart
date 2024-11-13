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
                      Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            QDatePicker(
                              label: "Tanggal",
                              validator: Validator.required,
                              value: controller.tanggal,
                              onChanged: (value) {
                                controller.tanggal = value;
                              },
                            ),
                            QButton(
                              label: "Catat",
                              onPressed: () => controller.create(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              QTextField(
                label: "Search",
                validator: Validator.required,
                value: controller.search,
                onChanged: (value) {
                  controller.searchItem(value);
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

                  if (controller.search.isNotEmpty) {
                    if (!item["title"].toString().contains(controller.search) &&
                        !item["note"].toString().contains(controller.search)) {
                      return Container();
                    }
                  }

                  return QDismissible(
                    onDismiss: () {
                      controller.delete(item);
                    },
                    child: InkWell(
                      onTap: () async {
                        controller.title = item["title"];
                        controller.note = item["note"];
                        controller.tanggal = DateTime.parse(item["tanggal"]);

                        await showCustomDialog(
                          title: "Buat catatan",
                          children: [
                            Form(
                              key: controller.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  QTextField(
                                    label: "Title",
                                    validator: Validator.required,
                                    value: controller.title,
                                    onChanged: (value) {
                                      controller.title = value;
                                    },
                                  ),
                                  QMemoField(
                                    label: "Note",
                                    validator: Validator.required,
                                    value: controller.note,
                                    onChanged: (value) {
                                      controller.note = value;
                                    },
                                  ),
                                  QDatePicker(
                                    label: "Tanggal",
                                    validator: Validator.required,
                                    value: controller.tanggal,
                                    onChanged: (value) {
                                      controller.tanggal = value;
                                    },
                                  ),
                                  QButton(
                                    label: "Catat",
                                    onPressed: () =>
                                        controller.update(item["id"]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
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
                              height: 6.0,
                            ),
                            Text(
                              item["tanggal"] ?? "-",
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
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
