import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/histori_tahunan_detail_controller.dart';

class HistoriTahunanDetailView extends StatefulWidget {
  final int year;
  const HistoriTahunanDetailView({
    Key? key,
    required this.year,
  }) : super(key: key);

  Widget build(context, HistoriTahunanDetailController controller) {
    controller.view = this;

    return Column(
      children: [
        Builder(
          key: UniqueKey(),
          builder: (context) {
            List<Map> yields = [];
            List<Map> ihsgs = [];

            for (var i = 1; i <= 12; i++) {
              var item = LocalIHSGService.getHistoryByYearAndMonth(
                year: year,
                month: i,
              );
              if (item["yield"] != null && item["yield"] != 0) {
                yields.add({
                  "month": DateTime(year, item["month"], 1).MMM,
                  "value": item["yield"],
                  "month_number": item["month"],
                });
              } else {
                yields.add({
                  "month": DateTime(year, i, 1).MMM,
                  "value": 0,
                  "month_number": i,
                });
              }

              if (item["ihsg"] != null && item["ihsg"] != 0) {
                ihsgs.add({
                  "month": DateTime(year, item["month"], 1).MMM,
                  "value": item["ihsg"],
                  "month_number": item["month"],
                });
              } else {
                ihsgs.add({
                  "month": DateTime(year, i, 1).MMM,
                  "value": 0,
                  "month_number": i,
                });
              }
            }

            return Container(
              height: MediaQuery.of(context).size.height * 0.24,
              color: Theme.of(context).cardColor,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  interval: 1,
                  labelStyle: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                primaryYAxis: NumericAxis(
                  labelStyle: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                series: <CartesianSeries>[
                  SplineSeries<Map, String>(
                    color: Colors.blue,
                    dataSource: ihsgs,
                    xValueMapper: (Map data, _) => data["month"],
                    yValueMapper: (Map data, _) => data["value"],
                  ),
                  SplineSeries<Map, String>(
                    color: Colors.red,
                    dataSource: yields,
                    xValueMapper: (Map data, _) => data["month"],
                    yValueMapper: (Map data, _) => data["value"],
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Bulan",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Yield",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "IHSG",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemCount: 12,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var date = DateTime(year, index + 1, 1);

            var item = LocalIHSGService.getHistoryByYearAndMonth(
              year: date.year,
              month: date.month,
            );

            var ihsg = item["ihsg"] ?? 0;
            var yield = item["yield"] ?? 0;
            return Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "${date.MMM}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            initialValue: yield?.toString(),
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration.collapsed(
                              hintText: "0",
                            ),
                            onFieldSubmitted: (value) {
                              LocalIHSGService.insertOrUpdate(
                                date: date,
                                yield: double.tryParse(value.toString()) ?? 0,
                                ihsg: double.tryParse(ihsg.toString()) ?? 0,
                              );
                              HistoriIhsgController.instance.reload();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            initialValue: ihsg?.toString(),
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration.collapsed(
                              hintText: "0",
                            ),
                            onFieldSubmitted: (value) {
                              LocalIHSGService.insertOrUpdate(
                                date: date,
                                yield: double.tryParse(yield.toString()) ?? 0,
                                ihsg: double.tryParse(value.toString()) ?? 0,
                              );
                              HistoriIhsgController.instance.reload();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  State<HistoriTahunanDetailView> createState() =>
      HistoriTahunanDetailController();
}
