import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/saham/portofolio_edit_price/view/portofolio_edit_price_view.dart';
import 'package:hyper_ui/module/saham/stock_list/view/stock_list_view.dart';
import 'package:hyper_ui/service/stock_new_service.dart';
import 'package:hyper_ui/shared/widget/form/popfield/popfield.dart';
import '../controller/portofolio_new_controller.dart';

class PortofolioNewView extends StatefulWidget {
  const PortofolioNewView({Key? key}) : super(key: key);

  Widget build(context, PortofolioNewController controller) {
    controller.view = this;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: BalanceWidget(),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 12.0,
              bottom: 12.0,
              left: 12.0,
            ),
            child: Builder(builder: (context) {
              List values = [
                {
                  "label": "Valuation",
                  "value": StockNewService.valuationTotal,
                },
                {
                  "label": "Equity",
                  "value": StockNewService.costTotal,
                },
                {
                  "label": "Harga/unit",
                  "value": UserBalanceService.hargaUnitSaatIni,
                },
                {
                  "label": "Jumlah/unit",
                  "value": UserBalanceService.jumlahUnit,
                },
                {
                  "label": "Yield",
                  "value": StockNewService.yieldInPercent,
                  "suffix": "%",
                },
                {
                  "label": "IHSG",
                  "value": StockNewService.ihsg,
                  "suffix": "%",
                },
                {
                  "label": "IHSG Start",
                  "value": StockNewService.ihsgStart,
                  "on_tap": () async {
                    await Get.to(
                      Popfield(
                        title: "Edit IHSG Start",
                        label: "IHSG Start",
                        value: StockNewService.ihsgStart.toString(),
                        onChanged: (value) {
                          StockNewService.ihsgStart =
                              double.tryParse(value) ?? 0;
                        },
                      ),
                    );
                    controller.reload();
                  },
                },
                {
                  "label": "IHSG End",
                  "value": StockNewService.ihsgEnd,
                  "on_tap": () async {
                    await Get.to(
                      Popfield(
                        title: "Edit IHSG End",
                        label: "IHSG End",
                        value: StockNewService.ihsgEnd.toString(),
                        onChanged: (value) {
                          StockNewService.ihsgEnd = double.tryParse(value) ?? 0;
                        },
                      ),
                    );
                    controller.reload();
                  },
                },
              ];
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Kinerja",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.0 / 0.5,
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: values.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          bool editable = values[index]["on_tap"] != null;

                          var value = values[index]["label"] == "Sekuritas" ||
                                  values[index]["label"] == "Value effect" ||
                                  values[index]["label"] == "Fund alloc"
                              ? "${values[index]["value"]}"
                              : "${double.parse("${values[index]["value"]}").number}";

                          if (values[index]["suffix"] == "%") {
                            value =
                                double.parse(values[index]["value"].toString())
                                    .toStringAsFixed(2);
                          }
                          value = value + (values[index]["suffix"] ?? "");

                          return InkWell(
                            onTap: () {
                              if (!editable) return;
                              values[index]["on_tap"]();
                            },
                            child: Column(
                              children: [
                                Text(
                                  "${values[index]["label"]}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    decoration: !editable
                                        ? null
                                        : TextDecoration.underline,
                                  ),
                                ),
                                Text(
                                  value,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Expanded(
            child: StockListView(
              portofolioMode: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<PortofolioNewView> createState() => PortofolioNewController();
}
