import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class KategoriListView extends StatefulWidget {
  const KategoriListView({Key? key}) : super(key: key);

  Widget build(context, KategoriListController controller) {
    controller.view = this;
    if (controller.response == null) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "KategoriList",
        ),
        actions: const [],
      ),
      body: ListView.builder(
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
    );
  }

  @override
  State<KategoriListView> createState() => KategoriListController();
}
