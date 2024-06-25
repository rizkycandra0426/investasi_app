import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/investasi/pinjaman/widget/pinjaman_clippath.dart';
import 'package:hyper_ui/shared/util/type_extension/num_extension.dart';
import '../controller/pinjaman_controller.dart';

class PinjamanView extends StatefulWidget {
  const PinjamanView({Key? key}) : super(key: key);

  Widget build(context, PinjamanController controller) {
    controller.view = this;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Rancangan Pinjaman",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Stack(
          children: [
            ClipPath(
              clipper: PinjamanClipPathClass(),
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
                    SizedBox(
                      height: 70,
                    ),
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
                            "Pinjaman Awal",
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
                                  initialValue:
                                      controller.pinjamanAwal.currency,
                                  key: Key(
                                      "pinjaman_awal_${controller.pinjamanAwal}"),
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
                                  onChanged: (value) {
                                    controller.pinjamanAwal =
                                        double.tryParse(value) ?? 0;
                                  },
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
                            "Jangka Waktu Pinjaman",
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
                                  initialValue: controller.jangkaWaktuDalamTahun
                                      .toStringAsFixed(0),
                                  key: Key(
                                      "jangka_waktu_${controller.jangkaWaktuDalamTahun}"),
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
                                  onChanged: (value) {
                                    controller.jangkaWaktuDalamTahun =
                                        int.tryParse(value) ?? 0;
                                  },
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
                            "Persentase Bunga",
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
                                  initialValue: controller.persentaseBunga
                                      .toStringAsFixed(0),
                                  key: Key("key_${controller.persentaseBunga}"),
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
                                  onChanged: (value) {
                                    controller.persentaseBunga =
                                        int.tryParse(value) ?? 0;
                                  },
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
                          )
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
                                borderRadius: BorderRadius.circular(
                                    30), // Border radius 30
                              ),
                            ),
                            onPressed: () {
                              print("HITUNG?");
                              controller.hitung();
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
                        Container(
                          height: 55,
                          width: 130,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Border radius 30
                              ),
                            ),
                            onPressed: () {
                              controller.toggleContainerVisibility();
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
                      ],
                    ),
                    SizedBox(height: 20),
                    controller.isButtonPressed
                        ? Container(
                            padding:
                                EdgeInsets.only(top: 5, left: 10, right: 10),
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
                                  "Perkiraan Pembayaran Pinjaman/Bulan",
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
                                    Text(
                                      // "Rp. ${NumberFormat('###,###.0#', 'en_US').format(controller.hasil)}",
                                      "${controller.hasil.currency}",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        showCursor: true,
                                        cursorColor: Colors.transparent,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
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
                          )
                        : SizedBox(),
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
  State<PinjamanView> createState() => PinjamanController();
}
