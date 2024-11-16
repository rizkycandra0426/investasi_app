import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class KategoriListView extends StatefulWidget {
  const KategoriListView({Key? key}) : super(key: key);

  Widget build(context, KategoriListController controller) {
    controller.view = this;
    if (controller.response == null) return LoadingScaffold();
    if (DBService.get("pengaturan_anggaran") == null) {
      DBService.set("pengaturan_anggaran", "Spesifik tiap bulan");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengaturan Anggaran",
        ),
        actions: const [],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          QDropdownField(
            label: "Pengaturan Anggaran",
            validator: Validator.required,
            items: const [
              {
                "label": "Spesifik tiap bulan",
                "value": "Spesifik tiap bulan",
              },
              {
                "label": "Tiap bulan sama",
                "value": "Tiap bulan sama",
              }
            ],
            emptyMode: false,
            value: DBService.get("pengaturan_anggaran"),
            onChanged: (value, label) {
              DBService.set("pengaturan_anggaran", value.toString());
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.response!.data!.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.response!.data![index];
                var budget = getBudget(
                  name: item.namaKategoriPengeluaran!,
                  month: StatistikDashboardController.instance.currentDate.month
                      .toString(),
                  year: StatistikDashboardController.instance.currentDate.year
                      .toString(),
                );

                return InkWell(
                  onTap: () async {
                    await Get.to(KategoriListFormView(
                      item: item,
                      isTiapBulanSama: DBService.get("pengaturan_anggaran") ==
                          "Tiap bulan sama",
                    ));
                    controller.setState(() {});
                  },
                  child: PengeluaranItem(
                    label: item.namaKategoriPengeluaran!,
                    total: budget,
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<KategoriListView> createState() => KategoriListController();
}
