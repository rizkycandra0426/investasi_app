import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/berita_controller.dart';

class BeritaView extends StatefulWidget {
  const BeritaView({Key? key}) : super(key: key);

  Widget build(context, BeritaController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: Colors.white,
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
                      onPressed: () => Get.back(),
                    ),
                  ),
                  SizedBox(width: 100),
                  Container(
                    margin: EdgeInsets.only(top: 33),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Berita",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.new_releases,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text("Apple"),
                    subtitle: const Text("15 USD"),
                    trailing: SizedBox(
                      width: 120.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Hari",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<BeritaView> createState() => BeritaController();
}
