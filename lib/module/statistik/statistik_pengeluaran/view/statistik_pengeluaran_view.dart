import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/statistik_pengeluaran_controller.dart';
import '../widget/pengeluaran_card.dart';

class StatistikPengeluaranView extends StatefulWidget {
  const StatistikPengeluaranView({Key? key}) : super(key: key);

  Widget build(context, StatistikPengeluaranController controller) {
    controller.view = this;
    return Scaffold(
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Builder(
                  builder: (context) {
                    final List<Map> chartData = [
                      {
                        "year": "Jan",
                        "sales": 40,
                      },
                      {
                        "year": "Feb",
                        "sales": 90,
                      },
                      {
                        "year": "Mar",
                        "sales": 30,
                      },
                      {
                        "year": "Apr",
                        "sales": 80,
                      },
                      {
                        "year": "May",
                        "sales": 90,
                      }
                    ];

                    return Container(
                      height: 300,
                      color: Theme.of(context).cardColor,
                      // padding: const EdgeInsets.all(12.0),
                      child: SfCircularChart(
                        legend: Legend(isVisible: true),
                        series: <CircularSeries>[
                          PieSeries<Map, String>(
                            dataSource: chartData,
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                            ),
                            xValueMapper: (Map data, _) => data["year"],
                            yValueMapper: (Map data, _) => data["sales"],
                          )
                        ],
                      ),
                    );
                  },
                ),
                PengeluaranCard(
                  tittle: "makanan",
                  harga: "150.000",
                ),
                PengeluaranCard(
                  tittle: "kopi",
                  harga: "20.000",
                ),
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
