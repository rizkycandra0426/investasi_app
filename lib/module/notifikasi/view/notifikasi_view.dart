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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 90),
            Text(
              "Notifikasi",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
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
                    "Atur Waktu Pengingat! ${controller.hour.toString().padLeft(2, '0')}:${controller.minute.toString().padLeft(2, "0")} ${controller.timeFormat}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
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
                        minValue: 0,
                        maxValue: 23,
                        value: controller.hour,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          controller.updateTime(
                              value, controller.minute, controller.timeFormat);
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
                        minValue: 0,
                        maxValue: 59,
                        value: controller.minute,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        onChanged: (value) {
                          controller.updateTime(
                              controller.hour, value, controller.timeFormat);
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
                    controller.saveData(controller.hour, controller.minute,
                        controller.timeFormat);
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
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
