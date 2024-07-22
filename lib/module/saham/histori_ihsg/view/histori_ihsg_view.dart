import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/histori_ihsg_controller.dart';

class HistoriIhsgView extends StatefulWidget {
  const HistoriIhsgView({Key? key}) : super(key: key);

  Widget build(context, HistoriIhsgController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Histori Tahunan"),
        actions: const [],
      ),
      body: Column(
        children: [
          if (controller.year != null)
            Builder(
              builder: (context) {
                final List<Map> chartData = [
                  // {
                  //   "year": 2018,
                  //   "sales": 40,
                  // },
                ];

                var reversedItems = controller.items;
                reversedItems = reversedItems.reversed.toList();

                for (var item in reversedItems) {
                  var date = DateTime.parse(item["date"]);
                  var month = DateFormat("MMM").format(date);

                  if (date.year != controller.year) continue;

                  chartData.add({
                    "year": "$month",
                    "ihsg": item["yield_ihsg"],
                    "yield": item["yield_ihsg"] + 0.6,
                  });
                }

                return Container(
                  color: Theme.of(context).cardColor,
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.all(12.0),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <CartesianSeries>[
                      // Renders line chart
                      LineSeries<Map, String>(
                        color: Colors.red,
                        dataSource: chartData,
                        xValueMapper: (Map data, _) => data["year"],
                        yValueMapper: (Map data, _) => data["ihsg"],
                      ),
                      LineSeries<Map, String>(
                        color: Colors.green,
                        dataSource: chartData,
                        xValueMapper: (Map data, _) => data["year"],
                        yValueMapper: (Map data, _) => data["yield"],
                      )
                    ],
                  ),
                );
              },
            ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.items.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.items[index];
                var date = DateTime.parse(item["date"]);
                var month = DateFormat("MMMM").format(date);
                double monthYield =
                    controller.getYieldByMonth(month, date.year);

                bool visibleYear = false;
                if (index == 0) {
                  visibleYear = true;
                } else {
                  var prevDate =
                      DateTime.parse(controller.items[index - 1]["date"]);
                  if (prevDate.year != date.year) {
                    visibleYear = true;
                  }
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (visibleYear)
                      InkWell(
                        onTap: () {
                          controller.updateYear(date.year);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Builder(builder: (context) {
                            var yield = controller.getYield(date.year);
                            var ihsg = controller.getIhsg(date.year);
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      if (controller.year == date.year) ...[
                                        const Icon(
                                          Icons.check_circle,
                                          size: 24.0,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                      ],
                                      Text(
                                        "Year\n${date.year}",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Yield\n${yield.percentage}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "IHSG\n${ihsg.percentage}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                        ),
                      ),
                    if (controller.year == date.year)
                      Container(
                        color: index % 2 == 0
                            ? Colors.grey[200]
                            : Colors.grey[300],
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${month}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${(monthYield * 1.0).percentage}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${(item["yield_ihsg"] * 1.0 as double).percentage}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<HistoriIhsgView> createState() => HistoriIhsgController();
}
