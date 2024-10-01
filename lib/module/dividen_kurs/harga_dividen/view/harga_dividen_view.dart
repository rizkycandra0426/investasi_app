import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/dividen_kurs/dividen/view/dividen_view.dart';
import 'package:hyper_ui/module/dividen_kurs/kurs/view/kurs_view.dart';
import '../controller/harga_dividen_controller.dart';

class HargaDividenView extends StatefulWidget {
  const HargaDividenView({Key? key}) : super(key: key);

  Widget build(context, HargaDividenController controller) {
    controller.view = this;
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
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
                      onPressed: () => Get.back(),
                    ),
                  ),
                  SizedBox(width: 50),
                  Container(
                    margin: EdgeInsets.only(top: 33, left: 25),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Dividen & Kurs",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TabBar(
                indicatorColor: Colors.blue,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    child: Text(
                      "Dividen",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Kurs",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    DividenView(), // Memanggil view Portofolio
                    KursView(), // Memanggil view Stock
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HargaDividenView> createState() => HargaDividenController();
}
