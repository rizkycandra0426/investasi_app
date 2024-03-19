import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_month_and_year_response.dart';
import 'package:hyper_ui/module/transaksi_keuangan/widget/transaksi_clipath.dart';
import 'package:hyper_ui/shared/util/date_util/date_util.dart';
import '../controller/transaksi_keuangan_controller.dart';

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
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 24.0,
              ),
              onPressed: () {
                Get.offAll(MainNavigationView());
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Catat Transaksi",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
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
                    initialValue: item?.jumlah?.toString(),
                    showCursor: true,
                    cursorColor: Colors.transparent,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 26),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Rp',
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 26),
                    ),
                    onChanged: (value) {
                      controller.amount = double.tryParse(value) ?? 0;
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
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white60,
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
                      child: Text(
                        controller.categoryName.isEmpty
                            ? "Kategori"
                            : controller.categoryName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
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
                            await controller.save(false);
                            Get.offAll(TransaksiKeuanganView());
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
                            child: QDropdownField(
                              label: "",
                              validator: Validator.required,
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
                              value: "Pemasukan",
                              onChanged: (value, label) {
                                controller.isPemasukan =
                                    value == "Pengeluaran" ? false : true;
                                controller.idCategory = 0;
                                controller.categoryName = "";
                                controller.setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: true,
                              child: QTextField(
                                label: "",
                                validator: Validator.required,
                                suffixIcon: null,
                                prefixIcon: null,
                                value: "${DateTime.now().yMd}",
                                onChanged: (value) {
                                  controller.date = DateTime.now();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (controller.isBottomSheetVisible)
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 24,
                          offset: Offset(0, 11),
                        ),
                      ],
                      border: Border.all(
                        width: 1.0,
                        color: Colors.white60,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    height: 300.0,
                    child: Column(
                      children: [
                        if (controller.isPemasukan)
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  controller.kategoriPemasukanList.length,
                              padding: EdgeInsets.all(12.0),
                              physics: ScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var item =
                                    controller.kategoriPemasukanList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item["label"]),
                                    onTap: () => controller.setCategoryValue(
                                      item["value"],
                                      item["label"],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        if (controller.isPengeluaran)
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  controller.kategoriPengeluaranList.length,
                              padding: EdgeInsets.all(12.0),
                              physics: ScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var item =
                                    controller.kategoriPengeluaranList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item["label"]),
                                    onTap: () => controller.setCategoryValue(
                                      item["value"],
                                      item["label"],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
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
