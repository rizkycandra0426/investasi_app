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
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Investasi.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Investasi",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Pinjaman.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Pinjaman",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Saham.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Saham",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
