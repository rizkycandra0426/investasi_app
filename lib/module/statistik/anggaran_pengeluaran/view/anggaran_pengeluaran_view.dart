import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/anggaran_pengeluaran_controller.dart';

class AnggaranPengeluaranView extends StatefulWidget {
  const AnggaranPengeluaranView({Key? key}) : super(key: key);

  Widget build(context, AnggaranPengeluaranController controller) {
    controller.view = this;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("AnggaranPengeluaran"),
      //   actions: const [],
      // ),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          Container(
            width: 10,
            height: 160,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bulanan",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 8,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          fixedSize: Size(100, 30)),
                      onPressed: () {},
                      child: const Text(
                        "Pengaturan",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 100,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "250.000 / 500.000 ",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 25,
            height: 90,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Makanan&Minuman",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 50,
                          height: 28,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "100.000 / 200.000",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<AnggaranPengeluaranView> createState() =>
      AnggaranPengeluaranController();
}
