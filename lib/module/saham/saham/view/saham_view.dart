import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/saham_controller.dart';

class SahamView extends StatefulWidget {
  const SahamView({Key? key}) : super(key: key);

  Widget build(context, SahamController controller) {
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
                  SizedBox(width: 40),
                  Container(
                    margin: EdgeInsets.only(top: 33, left: 25),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Portofolio Saham",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
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
                      "Portofolio",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Stock",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PortofolioView(), // Memanggil view Portofolio
                    StockView(), // Memanggil view Stock
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
  State<SahamView> createState() => SahamController();
}
