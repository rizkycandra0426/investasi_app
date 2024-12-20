import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class AnggaranPengeluaranView extends StatefulWidget {
  const AnggaranPengeluaranView({Key? key}) : super(key: key);

  Widget build(context, AnggaranPengeluaranController controller) {
    controller.view = this;
    if (controller.response == null) return LoadingScaffold();
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("AnggaranPengeluaran"),
      //   actions: const [],
      // ),
      body: ListView(
        key: UniqueKey(),
        physics: ScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sisa budget",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "${NumberFormat().format(controller.sisa)}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 42,
                    width: 150.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xfff7f7f9),
                        foregroundColor: Colors.blue,
                      ),
                      onPressed: () async {
                        await Get.to(KategoriListView());
                        controller.setState(() {});
                      },
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Pengaturan",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          PengeluaranItem(
            label: "Total",
            total: controller.total,
            budget: controller.totalBudget,
            index: 1,
          ),
          ListView.builder(
            itemCount: controller.response!.data!.length,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var item = controller.response!.data![index];
              var budget = getBudget(
                name: item.namaKategoriPengeluaran!,
                month: StatistikDashboardController.instance.currentDate.month
                    .toString(),
                year: StatistikDashboardController.instance.currentDate.year
                    .toString(),
              );

              return PengeluaranItem(
                label: item.namaKategoriPengeluaran!,
                // total: double.parse(item.total!.toString()),
                total: controller.getPengeluaranByNamaKategori(
                  item.namaKategoriPengeluaran!,
                ),
                budget: budget,
                index: index,
                enablePercentage: true,
              );
            },
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: QButton(
              label: "Rekap Anggaran",
              onPressed: () => Get.to(RekapAnggaranView()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<AnggaranPengeluaranView> createState() =>
      AnggaranPengeluaranController();
}
