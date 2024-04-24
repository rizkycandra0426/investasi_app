import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/util/animation/animation.dart';
import 'package:hyper_ui/shared/widget/loading/loading_scaffold.dart';
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
    if (controller.loading) return LoadingScaffold();
    var items = controller.response!.data!;

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
              itemCount: items.length,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];

                if (date != null) {
                  var filterDate = DateFormat("d MMM y").format(date!);
                  var currentDate = DateFormat("d MMM y")
                      .format(DateTime.parse(item.createdAt!));

                  if (filterDate != currentDate) {
                    return Container();
                  }
                }

                var day =
                    DateFormat("d").format(DateTime.parse(item.createdAt!));
                var dayName =
                    DateFormat("EEEE").format(DateTime.parse(item.createdAt!));
                var monthName =
                    DateFormat("MMMM").format(DateTime.parse(item.createdAt!));

                bool visible = false;
                bool dividerVisible = false;

                if (index == 0) {
                  visible = true;
                }

                if (index > 0) {
                  var beforeItem = items[index - 1];
                  var dateBefore = DateFormat("d MMM y")
                      .format(DateTime.parse(beforeItem.createdAt!));
                  var currentDate = DateFormat("d MMM y")
                      .format(DateTime.parse(item.createdAt!));

                  if (dateBefore != currentDate) {
                    visible = true;
                  }
                }

                if (index < items.length - 1) {
                  var afterItem = items[index + 1];
                  var dateBefore = DateFormat("d MMM y")
                      .format(DateTime.parse(item.createdAt!));
                  var currentDate = DateFormat("d MMM y")
                      .format(DateTime.parse(item.createdAt!));

                  if (dateBefore != currentDate) {
                    dividerVisible = true;
                  }
                }

                var amount = "Rp " + NumberFormat().format(item.jumlah);
                bool isPemasukan = item.type == "Pemasukan";
                bool isPengeluaran = item.type == "Pengeluaran";

                return InkWell(
                  onTap: () {
                    Get.offAll(TransaksiKeuanganView(
                      item: item,
                    ));
                  },
                  child: Column(
                    children: [
                      if (visible && index > 0)
                        Container(
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                          ),
                        ),
                      if (visible)
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "$day",
                                style: TextStyle(
                                  fontSize: 18.0,
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
                                  "$monthName",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 4.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${item.namaKategori}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: infoColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    "${item.catatan}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 80.0,
                              child: Text(
                                "${amount}",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: isPemasukan ? 16.0 : 0,
                                  fontWeight: FontWeight.bold,
                                  color: isPemasukan ? infoColor : warningColor,
                                ),
                              ),
                            ),
                            Container(
                              width: 80.0,
                              child: Text(
                                "${amount}",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: isPengeluaran ? 16.0 : 0,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isPengeluaran ? dangerColor : infoColor,
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
                  ).amx,
                );
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