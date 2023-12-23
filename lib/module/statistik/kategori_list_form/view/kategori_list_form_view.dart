import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/kategori_list_form_controller.dart';

class KategoriListFormView extends StatefulWidget {
  final Map item;
  KategoriListFormView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, KategoriListFormController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text("${item["label"]}"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              QNumberField(
                label: "Budget",
                validator: Validator.required,
                value: (item["budget"] ?? 0).toString(),
                onChanged: (value) {},
              ),
              QButton(
                label: "Save",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<KategoriListFormView> createState() => KategoriListFormController();
}
