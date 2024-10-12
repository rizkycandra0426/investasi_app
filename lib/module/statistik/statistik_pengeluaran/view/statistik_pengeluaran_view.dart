import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatistikPengeluaranView extends StatefulWidget {
  const StatistikPengeluaranView({Key? key}) : super(key: key);

  Widget build(context, StatistikPengeluaranController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();

    List categories = [];
    for (var item in controller.items) {
      categories.add(item["label"]);
    }

    print(categories);

    List<Color> generatePieChartColors() {
      // List of colors from Flutter's primary swatches
      List<MaterialColor> primarySwatches = [
        Colors.blue,
        Colors.lightBlue,
        Colors.cyan,
        Colors.teal,
        Colors.amber,
        Colors.orange,
        Colors.green,
        Colors.lightGreen,
        Colors.lime,
        Colors.yellow,
        Colors.pink,
        Colors.purple,
        Colors.deepPurple,
        Colors.deepOrange,
        Colors.red,
      ];

      List<Color> pieChartColors = [];

      for (int i = 0; i < controller.items.length; i++) {
        int index1 = i % primarySwatches.length;
        int index2 = (i + 1) % primarySwatches.length;

        Color mixedColor = Color.lerp(
            primarySwatches[index1][500]!, primarySwatches[index2][500]!, 1.0)!;
        pieChartColors.add(mixedColor);
      }

      return pieChartColors;
    }

    List<Color> colorSets = generatePieChartColors();

    return Scaffold(
      key: UniqueKey(),
      // appBar: AppBar(
      //   title: const Text("StatistikPengeluaran"),
      //   actions: const [],
      // ),
      body: ListView(
        physics: ScrollPhysics(), // Gantilah dengan jenis physics yang sesuai
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "Total Pengeluaran",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Builder(
                  builder: (context) {
                    double total = 0;
                    var items = controller.items;
                    items = items.where((i) => i["total"] > 0).toList();
                    for (var item in items) {
                      total += item["total"];
                    }

                    final List<Map> chartData = items.map((e) {
                      double itemTotal =
                          double.tryParse(e["total"].toString()) ?? 0;
                      double percentage = (itemTotal / total) * 100;
                      return {
                        "label": e["label"],
                        "sales": percentage,
                      };
                    }).toList();

                    return Container(
                      height: 300,
                      color: Theme.of(context).cardColor,
                      // padding: const EdgeInsets.all(12.0),
                      child: controller.items.isEmpty
                          ? Center(
                              child: Text("No Data"),
                            )
                          : SfCircularChart(
                              legend: Legend(isVisible: false),
                              series: <CircularSeries>[
                                PieSeries<Map, String>(
                                  dataSource: chartData,
                                  dataLabelSettings: const DataLabelSettings(
                                    isVisible: true,
                                  ),
                                  xValueMapper: (Map data, _) => data["label"],
                                  yValueMapper: (Map data, _) => data["sales"],
                                  dataLabelMapper: (datum, index) {
                                    return (datum["sales"] as double)
                                            .toStringAsFixed(2) +
                                        "%";
                                  },
                                  pointColorMapper: (datum, index) {
                                    var categoryindex =
                                        categories.indexOf(datum["label"]);
                                    print(datum);
                                    return colorSets[categoryindex];
                                  },
                                )
                              ],
                            ),
                    );
                  },
                ),
                for (var item in controller.items)
                  Builder(builder: (context) {
                    var index = controller.items.indexOf(item);
                    return PengeluaranCard(
                      title: item["label"],
                      harga: NumberFormat().format(item["total"]),
                      color: colorSets[index],
                    );
                  }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<StatistikPengeluaranView> createState() =>
      StatistikPengeluaranController();
}
