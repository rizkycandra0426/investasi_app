import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/saham/portofolio_edit_price/view/portofolio_edit_price_view.dart';
import 'package:hyper_ui/module/saham/stock_list/view/stock_list_view.dart';
import 'package:hyper_ui/service/offline_service.dart';
import 'package:hyper_ui/service/stock_new_service.dart';
import 'package:hyper_ui/shared/widget/extra/topbar.dart';
import 'package:hyper_ui/shared/widget/form/popfield/popfield.dart';
import '../controller/portofolio_new_controller.dart';

class PortofolioNewView extends StatefulWidget {
  const PortofolioNewView({Key? key}) : super(key: key);

  Widget build(context, PortofolioNewController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ValueListenableBuilder(
          valueListenable: TRX.historyList,
          builder: (context, child, value) {
            return SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  TopBar(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "${TRX.getSaldoTerakhir().number}",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      InkWell(
                        onTap: () => Get.to(TopupView(
                          topupMode: true,
                        )),
                        child: Text(
                          "Topup",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      InkWell(
                        onTap: () => Get.to(TopupView(
                          topupMode: false,
                        )),
                        child: Text(
                          "Withdraw",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => Get.to(HistoriDanaView()),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.wallet,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "Dana",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      InkWell(
                        onTap: () => Get.to(HistoriIhsgView()),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "Tahunan",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 12.0,
                      left: 12.0,
                    ),
                    child: Builder(builder: (context) {
                      return SingleChildScrollView(
                        controller: ScrollController(),
                        // scrollDirection: Axis.horizontal,
                        child: Column(
                          children: List.generate(2, (index) {
                            var year = now.year + index;

                            int targetYear = now.year + index;

                            List values = [
                              {
                                "label": "Valuation",
                                "value":
                                    TRX.getLastValuationPlusSaldo(targetYear),
                              },
                              {
                                "label": "Equity",
                                "value": TRX.getLastModal(targetYear),
                              },
                              // {
                              //   "label": "HU Before",
                              //   "value":
                              //       UserBalanceService.getHargaUnitSaatIni(year - 1),
                              // },
                              {
                                "label": "Harga Unit",
                                "value": TRX.getLastHargaUnit(targetYear),
                              },
                              {
                                "label": "Jumlah/unit",
                                "value": TRX.getlastJumlahUnit(targetYear),
                              },
                              {
                                "label": "Yield",
                                "value": TRX.getLastYield(targetYear),
                                "suffix": "%",
                              },
                              {
                                "label": "IHSG",
                                "value": index == 1
                                    ? StockNewService.ihsgNextYear
                                    : StockNewService.ihsg,
                                "suffix": "%",
                              },
                              {
                                "label": "IHSG Start",
                                "value": index == 1
                                    ? StockNewService.ihsgStartNextYear
                                    : StockNewService.ihsgStart,
                                "on_tap": () async {
                                  await Get.to(
                                    Popfield(
                                      title: "Edit IHSG Start",
                                      label: "IHSG Start",
                                      value: index == 1
                                          ? StockNewService.ihsgStartNextYear
                                              .toString()
                                          : StockNewService.ihsgStart
                                              .toString(),
                                      onChanged: (value) {
                                        if (index == 1) {
                                          StockNewService.ihsgStartNextYear =
                                              double.tryParse(value) ?? 0;
                                          return;
                                        }
                                        StockNewService.ihsgStart =
                                            double.tryParse(value) ?? 0;
                                      },
                                    ),
                                  );
                                  controller.reload();
                                  OfflineService.saveLocalValues();
                                },
                              },
                              {
                                "label": "IHSG End",
                                "value": index == 1
                                    ? StockNewService.ihsgEndNextYear
                                    : StockNewService.ihsgEnd,
                                "on_tap": () async {
                                  await Get.to(
                                    Popfield(
                                      title: "Edit IHSG End",
                                      label: "IHSG End",
                                      value: index == 1
                                          ? StockNewService.ihsgEndNextYear
                                              .toString()
                                          : StockNewService.ihsgEnd.toString(),
                                      onChanged: (value) {
                                        if (index == 1) {
                                          StockNewService.ihsgEndNextYear =
                                              double.tryParse(value) ?? 0;
                                          return;
                                        }
                                        StockNewService.ihsgEnd =
                                            double.tryParse(value) ?? 0;
                                      },
                                    ),
                                  );
                                  controller.reload();
                                  OfflineService.saveLocalValues();
                                },
                              },
                            ];

                            LocalIHSGService.insertOrUpdate(
                              date: DateTime(now.year, now.month, 1),
                              yield: StockNewService.getYieldInPercent(year),
                              ihsg: StockNewService.ihsg,
                            );

                            return Container(
                              margin: const EdgeInsets.only(
                                bottom: 12.0,
                              ),
                              child: Card(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      transform: Matrix4.translationValues(
                                        -8,
                                        -8,
                                        0,
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Text(
                                        "Kinerja $year",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: GridView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1.0 / 0.5,
                                          crossAxisCount: 4,
                                          mainAxisSpacing: 4,
                                          crossAxisSpacing: 0,
                                        ),
                                        itemCount: values.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          bool editable =
                                              values[index]["on_tap"] != null;

                                          var value = values[index]["label"] ==
                                                      "Sekuritas" ||
                                                  values[index]["label"] ==
                                                      "Value effect" ||
                                                  values[index]["label"] ==
                                                      "Fund alloc"
                                              ? "${values[index]["value"]}"
                                              : "${double.parse("${values[index]["value"]}").number}";

                                          if (values[index]["suffix"] == "%") {
                                            value = double.parse(values[index]
                                                        ["value"]
                                                    .toString())
                                                .toStringAsFixed(2);
                                          }
                                          value = value +
                                              (values[index]["suffix"] ?? "");

                                          return InkWell(
                                            onTap: () {
                                              if (!editable) return;
                                              values[index]["on_tap"]();
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  "${values[index]["label"]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontSize: 10.0,
                                                    decoration: !editable
                                                        ? null
                                                        : TextDecoration
                                                            .underline,
                                                  ),
                                                ),
                                                Text(
                                                  value,
                                                  textAlign: TextAlign.right,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                              ),
                            );
                          }),
                        ),
                      );
                    }),
                  ),
                  Divider(),
                  Builder(builder: (context) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                      ),
                      itemCount: TRX.portofolioSaham.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var item = TRX.portofolioSaham[index];

                        var itemValues = [
                          {
                            "label": "Saham",
                            "value": item.target,
                          },
                          {
                            "label": "Jumlah Lembar",
                            "value": item.sisaVolume.number,
                          },
                          {
                            "label": "Current Price",
                            "value": item.currentPrice.number,
                          },
                          {
                            "label": "Buying Price",
                            "value": item.buyingPrice.number,
                          },
                          {
                            "label": "Buy Total",
                            "value": item.equitySahamBerdasarkanVolume.number,
                          },
                          {
                            "label": "Valuation",
                            "value": item.valuation.number,
                          },
                          {
                            "label": "Floating Return",
                            "value": item.pl.number,
                          },
                          {
                            "label": "Fund Alloc",
                            "value": item.fundAlloc.percentage,
                          },
                          {
                            "label": "Value Effect",
                            "value": item.valueEffect.percentage,
                          },
                          {
                            "label": "Sekuritas",
                            "value": item.sekuritas,
                          }
                        ];
                        return InkWell(
                          onTap: () => Get.to(
                            TradeHistoyView(saham: item.target),
                          ),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StaggeredGrid.count(
                                    crossAxisCount: 4,
                                    children: List.generate(
                                      itemValues.length,
                                      (index) {
                                        var value = itemValues[index];
                                        return StaggeredGridTile.fit(
                                          crossAxisCellCount: 1,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 12.0,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "${value["label"]}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 10.0,
                                                  ),
                                                ),
                                                Text(
                                                  "${value["value"]}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  })
                ],
              ),
            );
          }),
    );
  }

  @override
  State<PortofolioNewView> createState() => PortofolioNewController();
}
