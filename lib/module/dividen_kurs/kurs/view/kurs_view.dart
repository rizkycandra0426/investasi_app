import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/kurs_controller.dart';

class KursView extends StatefulWidget {
  const KursView({Key? key}) : super(key: key);

  Widget build(context, KursController controller) {
    controller.view = this;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                "Nilai Tukar Rupiah (Rp.) Terhadapat Mata Uang Asing",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Negara",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "Nilai Tukar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              for (var item in controller.items)
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          "${item["mata_uang"]}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${item["nilai_tukar"]}",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<KursView> createState() => KursController();
}
