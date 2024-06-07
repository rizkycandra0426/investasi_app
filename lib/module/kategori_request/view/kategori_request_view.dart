import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/kategori_request/widget/request_clippath.dart';
import '../controller/kategori_request_controller.dart';

class KategoriRequestView extends StatefulWidget {
  const KategoriRequestView({Key? key}) : super(key: key);

  Widget build(context, KategoriRequestController controller) {
    controller.view = this;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 60),
            Text(
              "Kategori Request",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: RequestClipPathClass(),
              child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 70),
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
                                  textAlign: TextAlign.center,
                                  showCursor: true,
                                  cursorColor: Colors.transparent,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                  ),
                                  onChanged: (value) {},
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
                      height: 115,
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
                            "Kategori",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          QDropdownField(
                            label: "",
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
                            onChanged: (value, label) =>
                                value == "Pengeluaran" ? false : true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
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
                        onPressed: () {},
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30), // Same as button's border radius
                          ),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            child: Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<KategoriRequestView> createState() => KategoriRequestController();
}
