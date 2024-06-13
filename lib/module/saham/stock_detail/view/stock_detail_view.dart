import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/stock_detail_response.dart';
import 'package:hyper_ui/module/saham/stock_detail/widget/widget_beli.dart';
import 'package:hyper_ui/module/saham/stock_detail/widget/widget_jual.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/stock_detail_controller.dart';

class StockDetailView extends StatefulWidget {
  StockDetailView({
    Key? key,
    required this.stock,
  }) : super(key: key);
  final Map<String, dynamic> stock;

  Widget build(context, StockDetailController controller) {
    controller.view = this;
    var value = controller.data?.response?.data?.results?.first;
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
          padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
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
                  padding: EdgeInsets.all(16.0),
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
                                stock["symbol"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent[400],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                stock["name"],
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            child: Image.network(
                              stock["logo"],
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
                                "${value?.open}",
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
                                "${value?.high}",
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
                                "${value?.low}",
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
                                "${value?.close}",
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
                                "${value?.volume}",
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
                          Expanded(
                            child: Beliwidget(),
                          ),
                          // showModalBottomSheet(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return SekuritasModalSheet();
                          //   },
                          // );
                          const SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
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
                        final List<Map<String, dynamic>> chartData = [];

                        for (var rowItem
                            in controller.data?.response?.data?.results ?? []) {
                          var item = rowItem as Result;
                          chartData.add({
                            "date": item.date, // Parse date string to DateTime
                            "sales": item.high,
                          });

                          // chartData.add({
                          //   "date": item.date!.add(Duration(
                          //       days: -1)), // Parse date string to DateTime
                          //   "sales": item.low,
                          // });
                        }

                        return Container(
                          color: Theme.of(context).cardColor,
                          padding: EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 500, // Define chart width as needed
                            height: 300, // Define chart height as needed
                            child: SfCartesianChart(
                              primaryXAxis: DateTimeAxis(),
                              primaryYAxis: NumericAxis(),
                              series: <CartesianSeries>[
                                // Renders line chart
                                LineSeries<Map<String, dynamic>, DateTime>(
                                  // Notice the generic type `DateTime` for x-axis
                                  dataSource: chartData,
                                  xValueMapper:
                                      (Map<String, dynamic> data, _) =>
                                          data["date"],
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
