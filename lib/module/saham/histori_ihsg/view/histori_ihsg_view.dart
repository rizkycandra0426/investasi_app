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
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var yearItems =
                    LocalIHSGService.getLastValue(year: now.year - index);

                var yearYield = 0.0;
                var yearIhsg = 0.0;

                for (var item in yearItems) {
                  if (item["yield"] != null && item["yield"] != 0) {
                    yearYield = item["yield"];
                    break;
                  }
                }

                for (var item in yearItems) {
                  if (item["ihsg"] != null && item["ihsg"] != 0) {
                    yearIhsg = item["ihsg"];
                    break;
                  }
                }

                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.updateSelectedYear(now.year - index);
                      },
                      child: Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${now.year - index}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "$yearYield %",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "$yearIhsg %",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (controller.selectedYear == now.year - index)
                      HistoriTahunanDetailView(
                        year: now.year - index,
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
