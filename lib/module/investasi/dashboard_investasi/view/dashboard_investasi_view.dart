import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/dashboard_investasi_controller.dart';

class DashboardInvestasiView extends StatefulWidget {
  const DashboardInvestasiView({Key? key}) : super(key: key);

  Widget build(context, DashboardInvestasiController controller) {
    controller.view = this;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                color: Colors.red,
                margin: EdgeInsets.only(
                  right: 80,
                  left: 80,
                ),
              ),
              onTap: () {
                Get.to(InvestasiView());
              },
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                color: Colors.green,
                margin: EdgeInsets.only(
                  right: 80,
                  left: 80,
                ),
              ),
              onTap: () {
                Get.to(PinjamanView());
              },
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                color: Colors.blue,
                margin: EdgeInsets.only(
                  right: 80,
                  left: 80,
                ),
              ),
              onTap: () {
                Get.to(SahamView());
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardInvestasiView> createState() => DashboardInvestasiController();
}
