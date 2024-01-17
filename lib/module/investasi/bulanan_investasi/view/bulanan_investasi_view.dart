import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/bulanan_investasi_controller.dart';

class BulananInvestasiView extends StatefulWidget {
  const BulananInvestasiView({Key? key}) : super(key: key);

  Widget build(context, BulananInvestasiController controller) {
    controller.view = this;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
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
                  color: Colors.grey[300],
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
                          child: TextField(
                            textAlign: TextAlign.center,
                            showCursor: true,
                            cursorColor: Colors.transparent,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                          child: TextField(
                            textAlign: TextAlign.center,
                            showCursor: true,
                            cursorColor: Colors.transparent,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "/Tahun",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                height: 105,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                      label: "",
                      validator: Validator.required,
                      items: [
                        {
                          "label": "Sangat Konservatif",
                          "value": "Sangat Konservatif",
                        },
                        {
                          "label": "Konservatif",
                          "value": "Konserfativ",
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
                      value: "Sangat Konservatif",
                      onChanged: (value, label) {
                        controller.isBulanan =
                            value == "Konserfatif,Moderat,Agresif"
                                ? false
                                : true;
                        controller.setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: 130,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Border radius 30
                        ),
                      ),
                      onPressed: () {
                        Get.offAll(LumpsumInvestasiView());
                      },
                      child: Text(
                        "Hitung",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 130,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Border radius 30
                        ),
                      ),
                      onPressed: () {
                        Get.offAll(LumpsumInvestasiView());
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                      "Nilai Investasi yang Didapat",
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
                          child: TextField(
                            textAlign: TextAlign.center,
                            showCursor: true,
                            cursorColor: Colors.transparent,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<BulananInvestasiView> createState() => BulananInvestasiController();
}
