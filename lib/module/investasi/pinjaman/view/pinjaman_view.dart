import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/investasi/pinjaman/widget/pinjaman_clippath.dart';
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
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 24.0,
              ),
              onPressed: () => Get.offAll(MainNavigationView()),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Rancangan Pinjaman",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: PinjamanClipPathClass(),
              child: Container(
                height: 160,
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
                        color: Colors.white,
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
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  showCursor: true,
                                  cursorColor: Colors.transparent,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
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
                        color: Colors.white,
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
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  showCursor: true,
                                  cursorColor: Colors.transparent,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
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
                      height: 90,
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
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Presentase Bunga",
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "%",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
//                     SizedBox(height: 20),
//                     Container(
//   padding: EdgeInsets.only(top: 5, left: 10, right: 10),
//   height: 90,
//   width: MediaQuery.of(context).size.width,
//   decoration: BoxDecoration(
//     color: Colors.white,
//     boxShadow: [
//       BoxShadow(
//         color: Color(0x19000000),
//         blurRadius: 24,
//         offset: Offset(0, 11),
//       ),
//     ],
//   ),
//   child: Column(
//     children: [
//       Text(
//         "Perkiraan Dana Investasi/Bulan",
//         style: TextStyle(fontSize: 16, color: Colors.black),
//       ),
//       SizedBox(height: 5),
//       DropdownButton<String>(
//         value: _selectedValue, // State variable to hold the selected value
//         isExpanded: true,
//         icon: const Icon(Icons.arrow_drop_down),
//         iconSize: 24,
//         elevation: 16,
//         style: const TextStyle(color: Colors.black),
//         underline: Container(
//           height: 2,
//           color: Colors.black,
//         ),
//         onChanged: (String? newValue) {
//           setState(() {
//             _selectedValue = newValue!;
//           });
//         },
//         items: <String>['Rp. 100.000', 'Rp. 200.000', 'Rp. 500.000']
//             .map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     ],
//   ),
// ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      height: 90,
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
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Perkiraan Dana Investasi/Bulan",
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
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
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                borderRadius: BorderRadius.circular(
                                    30), // Border radius 30
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
