import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/notifikasi/widget/notifikasi_clippath.dart';
import '../controller/notifikasi_controller.dart';
import 'package:numberpicker/numberpicker.dart';

class NotifikasiView extends StatefulWidget {
  const NotifikasiView({Key? key}) : super(key: key);

  Widget build(context, NotifikasiController controller) {
    controller.view = this;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Notifikasi",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: NotifikasiClipPathClass(),
            child: Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
          ),
          SizedBox(
              height: AppBar()
                  .preferredSize
                  .height), // Menambahkan jarak yang sama dengan tinggi AppBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Atur Waktu Pengingat!",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberPicker(
                        key: UniqueKey(),
                        minValue: 0,
                        maxValue: 23,
                        value: controller.hour,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          print("Changed to $value");
                          controller.hour = value;
                          controller.setState(() {});
                        },
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        selectedTextStyle:
                            const TextStyle(color: Colors.white, fontSize: 30),
                        decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                color: Colors.white,
                              ),
                              bottom: BorderSide(color: Colors.white)),
                        ),
                      ),
                      NumberPicker(
                        key: UniqueKey(),
                        minValue: 0,
                        maxValue: 59,
                        value: controller.minute,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          print("Changed to $value");
                          controller.minute = value;
                          controller.setState(() {});
                        },
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        selectedTextStyle:
                            const TextStyle(color: Colors.white, fontSize: 30),
                        decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                color: Colors.white,
                              ),
                              bottom: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: 20), // Menambahkan jarak antara konten dan tombol
                ElevatedButton(
                  onPressed: () {
                    controller.save();
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(Size(200, 50)),
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<NotifikasiView> createState() => NotifikasiController();
}
