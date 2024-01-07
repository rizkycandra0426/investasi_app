import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/lumpsum_investasi_controller.dart';

class LumpsumInvestasiView extends StatefulWidget {
  const LumpsumInvestasiView({Key? key}) : super(key: key);

  Widget build(context, LumpsumInvestasiController controller) {
    controller.view = this;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: 80,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.green,
                height: 80,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.blue,
                height: 80,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.blue,
                height: 80,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.red,
                    height: 50,
                    width: 140,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 50,
                    width: 140,
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
  State<LumpsumInvestasiView> createState() => LumpsumInvestasiController();
}
