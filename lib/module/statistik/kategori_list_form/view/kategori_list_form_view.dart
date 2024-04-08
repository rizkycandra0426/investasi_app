import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_categories_by_month_and_year_response.dart';
import 'package:hyper_ui/service/budget_service.dart';
import '../controller/kategori_list_form_controller.dart';

class KategoriListFormView extends StatefulWidget {
  final Datum item;
  KategoriListFormView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, KategoriListFormController controller) {
    controller.view = this;
    var budget = getBudget(item.namaKategoriPengeluaran!);

    return Scaffold(
      appBar: AppBar(
        title: Text("${item.namaKategoriPengeluaran}"),
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
                value: budget.toString(),
                onChanged: (value) {
                  controller.userBudget = double.tryParse(value) ?? 0;
                },
              ),
              QButton(
                label: "Save",
                onPressed: () {
                  setBudget(
                      item.namaKategoriPengeluaran!, controller.userBudget);
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
