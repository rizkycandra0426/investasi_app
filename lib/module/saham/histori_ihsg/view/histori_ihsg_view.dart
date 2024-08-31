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
        title: const Text("Histori Tahunan (IHSG)"),
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var targetYear = (now.year + 1) - index;
                var yearItems = LocalIHSGService.getLastValue(year: targetYear);

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
                        controller.updateSelectedYear(targetYear);
                      },
                      child: Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${targetYear}",
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
                                "${TRX.getLastYield(targetYear).percentage}",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${yearIhsg.percentage}",
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
                    if (controller.selectedYear == targetYear)
                      HistoriTahunanDetailView(
                        year: targetYear,
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
