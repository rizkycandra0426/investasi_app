// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class CategorySelectorView extends StatefulWidget {
  const CategorySelectorView({Key? key}) : super(key: key);

  @override
  State<CategorySelectorView> createState() => _CategorySelectorViewState();
}

class _CategorySelectorViewState extends State<CategorySelectorView> {
  @override
  Widget build(BuildContext context) {
    var controller = TransaksiKeuanganController.instance;
    var categories = controller.getSelectedCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih kategori"),
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              padding: EdgeInsets.all(12.0),
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = categories[index];
                return Card(
                  child: ListTile(
                    title: Text(item["label"]),
                    onTap: () {
                      controller.setCategoryValue(
                        item["value"],
                        item["label"],
                      );
                      Get.back();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
