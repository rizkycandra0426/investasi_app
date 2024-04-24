import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/notifikasi_controller.dart';
import 'package:numberpicker/numberpicker.dart';

class NotifikasiView extends StatefulWidget {
  const NotifikasiView({Key? key}) : super(key: key);

  Widget build(context, NotifikasiController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Notifikasi",
            style: TextStyle(fontSize: 16),
          ),
        ),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Pick Your Time! ${controller.hour.toString().padLeft(2, '0')}:${controller.minute.toString().padLeft(2, "0")} ${controller.timeFormat}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
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
                  // Column(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         controller.updateTime(
                  //             controller.hour, controller.minute, "AM");
                  //       },
                  //       child: Container(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 20, vertical: 10),
                  //         decoration: BoxDecoration(
                  //             color: controller.timeFormat == "AM"
                  //                 ? Colors.grey.shade800
                  //                 : Colors.grey.shade700,
                  //             border: Border.all(
                  //               color: controller.timeFormat == "AM"
                  //                   ? Colors.grey
                  //                   : Colors.grey.shade700,
                  //             )),
                  //         child: const Text(
                  //           "AM",
                  //           style: TextStyle(color: Colors.white, fontSize: 25),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 15,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         controller.updateTime(
                  //             controller.hour, controller.minute, "PM");
                  //       },
                  //       child: Container(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 20, vertical: 10),
                  //         decoration: BoxDecoration(
                  //           color: controller.timeFormat == "PM"
                  //               ? Colors.grey.shade800
                  //               : Colors.grey.shade700,
                  //           border: Border.all(
                  //             color: controller.timeFormat == "PM"
                  //                 ? Colors.grey
                  //                 : Colors.grey.shade700,
                  //           ),
                  //         ),
                  //         child: const Text(
                  //           "PM",
                  //           style: TextStyle(color: Colors.white, fontSize: 25),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<NotifikasiView> createState() => NotifikasiController();
}
