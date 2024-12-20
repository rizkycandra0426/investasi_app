import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class LumpsumInvestasiView extends StatefulWidget {
  LumpsumInvestasiView({Key? key}) : super(key: key);

  Widget build(context, LumpsumInvestasiController controller) {
    controller.view = this;
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Container(
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Dana Investasi Awal",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Rp.",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: TextFormField(
                            controller: controller.investasiAwalController,
                            onTap: () {
                              controller.investasiAwalController.selection =
                                  TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .investasiAwalController.value.text.length,
                              );
                            },
                            key: Key(
                                "investasi_awal_${controller.investasiAwal}"),
                            textAlign: TextAlign.center,
                            showCursor: true,
                            cursorColor: Colors.transparent,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            onChanged: (value) {
                              final NumberFormat _numberFormat = NumberFormat(
                                '#,###',
                              );
                              final formattedValue = _numberFormat.format(
                                  double.tryParse(value.replaceAll(',', '')) ??
                                      0);
                              controller.investasiAwalController.value =
                                  TextEditingValue(
                                text: formattedValue,
                                selection: TextSelection.fromPosition(
                                  TextPosition(offset: formattedValue.length),
                                ),
                              );

                              var valuex = value.replaceAll(",", "");
                              valuex = valuex.replaceAll(".", "");
                              controller.investasiAwal =
                                  double.tryParse(valuex) ?? 0;
                            },
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Jangka Waktu Investasi",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.jangkaWaktuController,
                            onTap: () {
                              controller.jangkaWaktuController.selection =
                                  TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .jangkaWaktuController.value.text.length,
                              );
                            },
                            key: Key(
                                "jangka_waktu_${controller.jangkaWaktuDalamTahun}"),
                            textAlign: TextAlign.center,
                            showCursor: true,
                            cursorColor: Colors.transparent,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            onChanged: (value) {
                              controller.jangkaWaktuDalamTahun =
                                  int.tryParse(value) ?? 0;
                            },
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Tahun",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Presentase Bunga",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    QDropdownField(
                      key: Key(
                          "jenis_persentase_${controller.jenisPersentaseBunga}"),
                      label: "",
                      emptyMode: false,
                      validator: Validator.required,
                      items: [
                        {
                          "label": "Sangat Konservatif",
                          "value": "Sangat Konservatif",
                        },
                        {
                          "label": "Konservatif",
                          "value": "Konservatif",
                        },
                        {
                          "label": "Moderat",
                          "value": "Moderat",
                        },
                        {
                          "label": "Agresif",
                          "value": "Agresif",
                        }
                      ],
                      value: controller.jenisPersentaseBunga,
                      onChanged: (value, label) {
                        controller.isLumpsum =
                            value == "Konserfatif,Moderat,Agresif"
                                ? false
                                : true;
                        controller.setState(() {});
                        controller.jenisPersentaseBunga = value;
                      },
                    ),
                    SizedBox(height: 10), // Spasi sebelum slider
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: controller.formKey,
                            child: TextFormField(
                              key:
                                  Key("key_${controller.jenisPersentaseBunga}"),
                              validator: (value) {
                                if ((double.tryParse(value!.toString()) ?? 0) >
                                    controller.maxPercentage) {
                                  // Set your maximum value here
                                  // return 'Persentase Melebihi Batas ${controller.maxPercentage}';
                                }
                                return null; // Valid
                              },
                              textAlign: TextAlign.center,
                              showCursor: true,
                              cursorColor: Colors.transparent,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                hintText: controller.percentageHint,
                              ),
                              onChanged: (value) {
                                controller.persentaseBunga =
                                    double.tryParse(value) ?? 0;
                                bool isNotValid = controller
                                        .formKey.currentState!
                                        .validate() ==
                                    false;
                                if (isNotValid) {
                                  return;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "%",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Border radius 30
                          ),
                        ),
                        onPressed: () async {
                          bool isNotValid =
                              controller.formKey.currentState!.validate() ==
                                  false;
                          if (isNotValid) {
                            return;
                          }
                          print("HITUNG?");
                          controller.hitung();

                          Get.to(DetailInvestasi());
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30), // Same as button's border radius
                          ),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            child: Text(
                              "Hitung",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Border radius 30
                          ),
                        ),
                        onPressed: () {
                          // controller.toggleContainerVisibility();
                          controller.reset();
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30), // Same as button's border radius
                          ),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 30),
              // controller.isButtonPressed
              //     ? Container(
              //         padding: EdgeInsets.only(top: 5, left: 10, right: 10),
              //         height: 90,
              //         width: MediaQuery.of(context).size.width,
              //         decoration: BoxDecoration(
              //           color: Colors.white70,
              //           borderRadius: BorderRadius.circular(20),
              //           boxShadow: [
              //             BoxShadow(
              //               color: Color(0x19000000),
              //               blurRadius: 24,
              //               offset: Offset(0, 11),
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           children: [
              //             Text(
              //               "Nilai Investasi yang Didapat",
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 color: Colors.black,
              //               ),
              //             ),
              //             SizedBox(height: 5),
              //             Row(
              //               children: [
              //                 Text(
              //                   "Rp.",
              //                   style: TextStyle(fontSize: 14),
              //                 ),
              //                 SizedBox(width: 5),
              //                 Text(
              //                   // "Rp. ${NumberFormat('###,###.0#', 'en_US').format(controller.hasil)}",
              //                   "${controller.hasil.number}",
              //                   style: TextStyle(fontSize: 14),
              //                 ),
              //                 SizedBox(width: 5),
              //                 Expanded(
              //                   child: TextFormField(
              //                     textAlign: TextAlign.center,
              //                     showCursor: true,
              //                     cursorColor: Colors.transparent,
              //                     style: TextStyle(
              //                         color: Colors.black, fontSize: 15),
              //                     decoration: InputDecoration(
              //                       filled: true,
              //                       fillColor: Colors.transparent,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             )
              //           ],
              //         ),
              //       )
              //     : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LumpsumInvestasiView> createState() => LumpsumInvestasiController();
}
