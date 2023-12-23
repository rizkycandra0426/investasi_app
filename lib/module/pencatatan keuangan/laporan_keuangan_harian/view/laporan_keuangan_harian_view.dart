import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/util/animation/animation.dart';
import '../controller/laporan_keuangan_harian_controller.dart';

class LaporanKeuanganHarianView extends StatefulWidget {
  final bool enableAppBar;
  final DateTime? date;
  LaporanKeuanganHarianView({
    Key? key,
    this.enableAppBar = false,
    this.date,
  }) : super(key: key);

  Widget build(context, LaporanKeuanganHarianController controller) {
    controller.view = this;
    return Scaffold(
      appBar: enableAppBar
          ? AppBar(
              title: Text("${DateFormat("d MMM y").format(date!)}"),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.items.length,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.items[index];

                if (date != null) {
                  var filterDate = DateFormat("d MMM y").format(date!);
                  var currentDate = DateFormat("d MMM y")
                      .format(DateTime.parse(item["date"]));

                  if (filterDate != currentDate) {
                    return Container();
                  }
                }

                var day = DateFormat("d").format(DateTime.parse(item["date"]));
                var dayName =
                    DateFormat("EEEE").format(DateTime.parse(item["date"]));

                bool visible = false;
                bool dividerVisible = false;

                if (index == 0) {
                  visible = true;
                }

                if (index > 0) {
                  var beforeItem = controller.items[index - 1];
                  var dateBefore = DateFormat("d MMM y")
                      .format(DateTime.parse(beforeItem["date"]));
                  var currentDate = DateFormat("d MMM y")
                      .format(DateTime.parse(item["date"]));

                  if (dateBefore != currentDate) {
                    visible = true;
                  }
                }

                if (index < controller.items.length - 1) {
                  var afterItem = controller.items[index + 1];
                  var dateBefore = DateFormat("d MMM y")
                      .format(DateTime.parse(afterItem["date"]));
                  var currentDate = DateFormat("d MMM y")
                      .format(DateTime.parse(item["date"]));

                  if (dateBefore != currentDate) {
                    dividerVisible = true;
                  }
                }

                var amount = "Rp " + NumberFormat().format(item["amount"]);
                return Column(
                  children: [
                    if (visible)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              child: Row(
                                children: [
                                  Text(
                                    "$day",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      color: dangerColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4.0),
                                      ),
                                    ),
                                    child: Text(
                                      "$dayName",
                                      style: TextStyle(
                                        fontSize: 8.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Rp 230.000.000,-",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: infoColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Rp 230.000.000,-",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: warningColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Text(
                              "${item["category"]}",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${item["account_name"]}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: infoColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "${item["description"]}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${amount}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: warningColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (dividerVisible)
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                      ),
                  ],
                ).amx;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<LaporanKeuanganHarianView> createState() =>
      LaporanKeuanganHarianController();
}
