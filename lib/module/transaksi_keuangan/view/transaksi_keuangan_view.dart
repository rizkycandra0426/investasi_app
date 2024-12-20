import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_month_and_year_response.dart';

class TransaksiKeuanganView extends StatefulWidget {
  final HistoryHarian? item;
  TransaksiKeuanganView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, TransaksiKeuanganController controller) {
    controller.view = this;
    if (controller.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: BackButton(),
        title: Text(
          "Catat Transaksi",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Container(
                  margin: EdgeInsets.only(top: 225, left: 10, right: 10),
                  child: TextFormField(
                    controller: controller.textEditingController,
                    focusNode: controller.focusNode,
                    showCursor: true,
                    cursorColor: Colors.transparent,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 26),
                    keyboardType: TextInputType.number,
                    validator: Validator.required,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Rp.',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                    onChanged: (value) {
                      final NumberFormat _numberFormat = NumberFormat(
                        '#,###',
                      );
                      final formattedValue = _numberFormat.format(
                          double.tryParse(value.replaceAll(',', '')) ?? 0);
                      controller.textEditingController.value = TextEditingValue(
                        text: formattedValue,
                        selection: TextSelection.fromPosition(
                          TextPosition(offset: formattedValue.length),
                        ),
                      );

                      var valuex = value.replaceAll(",", "");
                      valuex = valuex.replaceAll(".", "");
                      controller.amount = double.tryParse(valuex) ?? 0;
                    },
                    onFieldSubmitted: (value) {
                      // controller.amount = double.tryParse(value) ?? 0;
                    },
                  ),
                ),
              ),
              Positioned(
                top: 345,
                child: Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 400,
                left: 25,
                right: 25,
                child: InkWell(
                  onTap: () => controller.showBottomSheet(),
                  child: AbsorbPointer(
                    child: Stack(
                      children: [
                        if (controller.categoryName.isEmpty)
                          QTextField(
                            label: "",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Kategori tidak boleh kosong";
                              }
                              return null;
                            },
                            hint: "Kategori",
                            value: controller.categoryName,
                            onChanged: (value) {},
                          ),
                        if (controller.categoryName.isEmpty)
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 12.0,
                              ),
                              child: Text(
                                "Kategori",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        if (controller.categoryName.isEmpty == false)
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 12.0,
                              ),
                              child: Text(
                                "${controller.categoryName}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  // child: Container(
                  //   height: 60,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white60,
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Color(0x19000000),
                  //         blurRadius: 24,
                  //         offset: Offset(0, 11),
                  //       ),
                  //     ],
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(30),
                  //     ),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       controller.categoryName.isEmpty
                  //           ? "Kategori"
                  //           : controller.categoryName,
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              Positioned(
                top: 500,
                left: 25,
                right: 25,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 24,
                        offset: Offset(0, 11),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      initialValue: item?.catatan?.toString(),
                      showCursor: true,
                      cursorColor: Colors.transparent,
                      textAlign: TextAlign.center,
                      validator: Validator.required,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: 'Catatan',
                        hintStyle:
                            TextStyle(color: Colors.black54, fontSize: 20),
                      ),
                      onChanged: (value) {
                        controller.memo = value;
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 625, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!controller.isEditMode)
                      Container(
                        width: 155,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () async {
                            await controller.save();
                            await Get.to(TransaksiKeuanganView());
                            DashboardController.instance.reload();
                          },
                          child: Text(
                            "Tambah Lagi",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    if (!controller.isEditMode)
                      Container(
                        width: 155,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () => controller.save(),
                          child: Text(
                            "Selesai",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                    if (controller.isEditMode)
                      Container(
                        width: 155,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400],
                          ),
                          onPressed: () => controller.delete(),
                          child: Text(
                            "Delete",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ),
                    if (controller.isEditMode)
                      Container(
                        width: 155,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white60,
                          ),
                          onPressed: () => controller.update(),
                          child: Text(
                            "Update",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (!controller.isEditMode)
                Positioned(
                  left: 20,
                  right: 20,
                  top: 20,
                  child: SafeArea(
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Builder(builder: (context) {
                              return QDropdownField(
                                label: "",
                                validator: Validator.required,
                                emptyMode: false,
                                items: [
                                  {
                                    "label": "Pemasukan",
                                    "value": "Pemasukan",
                                  },
                                  {
                                    "label": "Pengeluaran",
                                    "value": "Pengeluaran",
                                  }
                                ],
                                value: controller.categoryValue,
                                onChanged: (value, label) {
                                  print("$value");
                                  controller.isPemasukan = value == "Pemasukan";
                                  controller.idCategory = 0;
                                  controller.categoryName = "";
                                  controller.categoryValue = value;
                                  controller.reload();
                                },
                              );
                            }),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: QDatePicker(
                              label: "",
                              validator: Validator.required,
                              value: DateTime.now(),
                              onChanged: (value) {
                                print(value);
                                controller.date = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<TransaksiKeuanganView> createState() => TransaksiKeuanganController();
}
