import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

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
            child: Builder(builder: (context) {
              items.sort((a, b) => b.tanggal!.compareTo(a.tanggal!));
              return ListView.builder(
                itemCount: items.length,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = items[index];

                  if (item.action == "delete") return Container();

                  if (date != null) {
                    var filterDate = DateFormat("d MMM y").format(date!);
                    var currentDate =
                        DateFormat("d MMM y").format(item.tanggal!);

                    if (filterDate != currentDate) {
                      return Container();
                    }
                  }

                  var day = DateFormat("d").format(item.tanggal!);
                  var dayName = DateFormat("EEEE").format(item.tanggal!);
                  var monthName = DateFormat("MMMM").format(item.tanggal!);

                  bool visible = false;
                  bool dividerVisible = false;

                  if (index == 0) {
                    visible = true;
                  }

                  if (index > 0) {
                    var beforeItem = items[index - 1];
                    var dateBefore =
                        DateFormat("d MMM y").format(item.tanggal!);
                    var currentDate =
                        DateFormat("d MMM y").format(item.tanggal!);

                    if (dateBefore != currentDate) {
                      visible = true;
                    }
                  }

                  if (index < items.length - 1) {
                    var afterItem = items[index + 1];
                    var dateBefore =
                        DateFormat("d MMM y").format(item.tanggal!);
                    var currentDate =
                        DateFormat("d MMM y").format(item.tanggal!);

                    if (dateBefore != currentDate) {
                      dividerVisible = true;
                    }
                  }

                  visible = true;
                  if (index > 0) {
                    if (items[index - 1]
                        .tanggal!
                        .isSame(items[index].tanggal!)) {
                      visible = false;
                    }
                  }

                  var amount = "Rp " + NumberFormat().format(item.jumlah);
                  bool isPemasukan = item.type == "Pemasukan";
                  bool isPengeluaran = item.type == "Pengeluaran";

                  if (item.tanggal!.year !=
                          DashboardController.instance.currentDate.year ||
                      item.tanggal!.month !=
                          DashboardController.instance.currentDate.month)
                    return Container();

                  return InkWell(
                    onTap: () async {
                      await Get.to(TransaksiKeuanganView(
                        item: item,
                      ));
                      DashboardController.instance.reload();
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
                                        color: isPengeluaran
                                            ? dangerColor
                                            : infoColor,
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
                                    fontSize: isPemasukan ? 14.0 : 0,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isPengeluaran ? dangerColor : infoColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: 80.0,
                                child: Text(
                                  "${amount}",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: isPengeluaran ? 14.0 : 0,
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
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  State<LaporanKeuanganHarianView> createState() =>
      LaporanKeuanganHarianController();
}
