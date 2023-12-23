import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/kategori_list_controller.dart';

class KategoriListView extends StatefulWidget {
  const KategoriListView({Key? key}) : super(key: key);

  Widget build(context, KategoriListController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("KategoriList"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: controller.pengeluaranList.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = controller.pengeluaranList[index];
          return InkWell(
            onTap: () {
              Get.to(KategoriListFormView(
                item: item,
              ));
            },
            child: PengeluaranItem(
              label: item["label"],
              total: double.parse(item["budget"].toString()),
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
