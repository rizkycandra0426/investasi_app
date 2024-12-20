import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class HistoriIhsgView extends StatefulWidget {
  const HistoriIhsgView({Key? key}) : super(key: key);

  Widget build(context, HistoriIhsgController controller) {
    controller.view = this;

    List years = TRX.availableYears();
    if (controller.mode == 0) {
      years.sort();
      years = [years.last];
      controller.selectedYear = years.last;
    } else {
      //desc
      years.sort((a, b) => b.compareTo(a));
      controller.selectedYear = years.first;
    }

    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: const Text("Histori Tahunan (IHSG)"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: QButton(
              width: controller.mode == 0 ? 100.0 : 140.0,
              label: controller.mode == 0 ? "Tahunan" : "Per Portofolio",
              color: warningColor,
              onPressed: () =>
                  controller.updateMode(controller.mode == 0 ? 1 : 0),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: years.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var targetYear = years[index];
                // var yearItems = LocalIHSGService.getLastValue(year: targetYear);

                // var yearYield = 0.0;
                // var yearIhsg = 0.0;

                // for (var item in yearItems) {
                //   if (item["yield"] != null && item["yield"] != 0) {
                //     yearYield = item["yield"];
                //     break;
                //   }
                // }

                // for (var item in yearItems) {
                //   if (item["ihsg"] != null && item["ihsg"] != 0) {
                //     yearIhsg = item["ihsg"];
                //     break;
                //   }
                // }

                double ihsgTotal = 0;
                double yieldTotal = 0;
                for (var i = 1; i < 12; i++) {
                  var item = LocalIHSGService.getHistoryByYearAndMonth(
                    year: targetYear,
                    month: i,
                  );

                  var ihsg = item["ihsg"] ?? 0;
                  var yield = TRX.getLastYieldInEndOfMonth(
                    targetYear,
                    i,
                  );
                  yieldTotal += yield;
                  ihsgTotal += ihsg;
                }

                // ####################
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
                                "${yieldTotal.percentage}",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${ihsgTotal.percentage}",
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
