import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/histori_detail_controller.dart';

class HistoriDetailView extends StatefulWidget {
  const HistoriDetailView({Key? key}) : super(key: key);

  Widget build(context, HistoriDetailController controller) {
    controller.view = this;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HistoriDetail"),
        actions: const [],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: screenHeight * 0.495,
                color: Colors.white,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    var item = 2;
                    return Card(
                      color: Colors.grey[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "emioten",
                                    // '${item["emiten"]}',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('floating return'),
                                      // Text(
                                      //   "${item["return"]}",
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w600,
                                      //     fontSize: 14,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('equity'),
                                      // Text(
                                      //   "${item["equity"]}",
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w600,
                                      //     fontSize: 14,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Vol total'),
                                      // Text(
                                      //   '${item["vol_total"]}',
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w600,
                                      //     fontSize: 13,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Vol beli'),
                                      // Text(
                                      //   '${item["vol_beli"]}',
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w600,
                                      //     fontSize: 13,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Vol jual'),
                                      // Text(
                                      //   '${item["vol_jual"]}',
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w600,
                                      //     fontSize: 13,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Avg beli'),
                                      // Text(
                                      //   '${item["avg_beli"]}',
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w600,
                                      //     fontSize: 13,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Avg jual'),
                                      // Text(
                                      //   '${item["avg_jual"]}',
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w600,
                                      //     fontSize: 13,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Close'),
                                      // Text(
                                      //   '${item["close"]}',
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w600,
                                      //     fontSize: 13,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HistoriDetailView> createState() => HistoriDetailController();
}
