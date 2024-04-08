import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/about_us_controller.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({Key? key}) : super(key: key);

  Widget build(context, AboutUsController controller) {
    controller.view = this;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 34, left: 0), // Atur margin atas sesuai kebutuhan
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 28,
                      ),
                      onPressed: () => Get.offAll(MainNavigationView()),
                    ),
                  ),
                  SizedBox(width: 80),
                  Container(
                    margin: EdgeInsets.only(top: 33),
                    alignment: Alignment.center,
                    child: Text(
                      "Tentang Kami",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AboutUsView> createState() => AboutUsController();
}
