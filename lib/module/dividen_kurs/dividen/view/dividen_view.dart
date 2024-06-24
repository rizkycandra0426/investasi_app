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
