import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/saham/stock_detail/widget/widget_beli.dart';
import 'package:hyper_ui/module/saham/stock_detail/widget/widget_jual.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/stock_detail_controller.dart';

class StockDetailView extends StatefulWidget {
  const StockDetailView({Key? key}) : super(key: key);

  Widget build(context, StockDetailController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 28,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: Column(
            children: [
              // Your existing card widget and other widgets here...
              Card(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'bbca',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent[400],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'pt bca',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            child: Image.network(
                              'logo',
                              width: 70,
                              height: 70,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Open",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "145.52",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "High",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "147.14",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Low",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "145.24",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Close",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "146.37",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Volume",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "5645678",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            child: Beliwidget(),
                          ),
                          // showModalBottomSheet(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return SekuritasModalSheet();
                          //   },
                          // );
                          Container(
                            width: 150,
                            child: Jualwidget(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 20),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        // Panggil metode pada controller
                      },
                      child: Text("30 Days",
                          style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 20),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        // Panggil metode pada controller
                      },
                      child: Text("60 Days",
                          style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 20),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        // Panggil metode pada controller
                      },
                      child: Text("90 Days",
                          style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 20),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        // Panggil metode pada controller
                      },
                      child: Text("120 Days",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Builder(
                      builder: (context) {
                        final List<Map<String, dynamic>> chartData = [
                          {"year": 2018, "sales": 40},
                          {"year": 2019, "sales": 90},
                          {"year": 2020, "sales": 30},
                          {"year": 2021, "sales": 80},
                          {"year": 2022, "sales": 90},
                        ];

                        return Container(
                          color: Theme.of(context).cardColor,
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 500, // Tentukan lebar chart sesuai kebutuhan
                            height:
                                300, // Tentukan tinggi chart sesuai kebutuhan
                            child: SfCartesianChart(
                              series: <CartesianSeries>[
                                // Renders line chart
                                LineSeries<Map<String, dynamic>, int>(
                                  dataSource: chartData,
                                  xValueMapper:
                                      (Map<String, dynamic> data, _) =>
                                          data["year"] as int,
                                  yValueMapper:
                                      (Map<String, dynamic> data, _) =>
                                          data["sales"] as int,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
  State<StockDetailView> createState() => StockDetailController();
}
