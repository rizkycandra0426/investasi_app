import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/dividen_controller.dart';

class DividenView extends StatefulWidget {
  const DividenView({Key? key}) : super(key: key);

  Widget build(context, DividenController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
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
                      "Emiten",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "Dividen",
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          "${item["emiten"]}",
                          style:
                              TextStyle(fontSize: 16, color: Colors.green[900]),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${item["dividen"]}",
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(fontSize: 16, color: Colors.green[900]),
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
  State<DividenView> createState() => DividenController();
}
