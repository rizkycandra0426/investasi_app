import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/offline_service.dart';
import '../controller/stock_list_controller.dart';

class StockListView extends StatefulWidget {
  final bool portofolioMode;
  const StockListView({
    Key? key,
    required this.portofolioMode,
  }) : super(key: key);

  Widget build(context, StockListController controller) {
    controller.view = this;
    return Column(
      children: [
        if (portofolioMode == false)
          Container(
            height: 64.0,
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 25, left: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.grey[300]!,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blueGrey[900],
                ),
              ),
              onSubmitted: (value) {
                controller.updateSearch(value);
              },
            ),
          ),
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: controller.items,
              builder: (context, child, value) {
                return ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: controller.items.value.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.items.value[index];
                    if (portofolioMode) {
                      if (item["buy_volume"] - item["sell_volume"] == 0)
                        return Container();
                    }

                    if (controller.search.isNotEmpty) {
                      if (!item["nama_saham"]
                          .toLowerCase()
                          .contains(controller.search.toLowerCase())) {
                        return Container();
                      }
                    }
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!portofolioMode)
                              Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    Image.network(
                                      item["pic"],
                                      width: 48.0,
                                      height: 48.0,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Image.network(
                                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                                          width: 32.0,
                                          height: 32.0,
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("${item["nama_saham"]}"),
                                          Text(
                                            "ID Saham: ${item["id_saham"]}",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (portofolioMode)
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          item["pic"],
                                          width: 32.0,
                                          height: 32.0,
                                          fit: BoxFit.cover,
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                            return Image.network(
                                              "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                                              width: 32.0,
                                              height: 32.0,
                                              fit: BoxFit.fill,
                                            );
                                          },
                                        ),
                                        const SizedBox(
                                          width: 4.0,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(item["nama_saham"]),
                                        ),
                                      ],
                                    ),
                                    if (portofolioMode) ...[
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        "Jumlah Lembar",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      Text(
                                        double.tryParse(
                                                    "${item["buy_volume"] - item["sell_volume"]}")
                                                ?.number ??
                                            "0",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Get.to(PortofolioEditPriceView(
                                            item: item,
                                          ));

                                          await reloadPortofolio();
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Current Price",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                            Builder(builder: (context) {
                                              var tradeHistories =
                                                  StockNewService.tradeHistories
                                                      .where((i) =>
                                                          i["id_saham"] ==
                                                          item["id_saham"])
                                                      .toList();

                                              double currentPrice = 0;

                                              if (tradeHistories.isNotEmpty) {
                                                currentPrice = tradeHistories
                                                    .last["current_price"];
                                              }
                                              return Text(
                                                double.parse("${currentPrice}")
                                                    .number,
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              );
                                            }),
                                            Icon(
                                              Icons.arrow_downward,
                                              size: 14.0,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  if (portofolioMode)
                                    Builder(builder: (context) {
                                      var currentVolume = (item["buy_volume"] -
                                          item["sell_volume"]);

                                      var summary = StockNewService.getSummary(
                                          item["id_saham"]);
                                      List values = [
                                        // {
                                        //   "label": "Buy volume",
                                        //   "value": item["buy_volume"],
                                        // },
                                        // {
                                        //   "label": "Sell volume",
                                        //   "value": item["sell_volume"],
                                        // },
                                        // {
                                        //   "label": "Buy price",
                                        //   // "value": item["buy_price"],
                                        //   "value": item["average"] ?? 0,
                                        // },
                                        // {
                                        //   "label": "Sell price",
                                        //   "value": item["sell_price"],
                                        // },
                                        // {
                                        //   "label": "Current price",
                                        //   "value": item["current_price"],
                                        // },
                                        // {
                                        //   "label": "Buy total",
                                        //   "value": currentVolume *
                                        //       (item["average"] ?? 0),
                                        // },
                                        {
                                          "label": "Cost",
                                          "value": (summary["cost"] as double)
                                              .number,
                                        },
                                        {
                                          "label": "Valuation",
                                          "value":
                                              (summary["valuation"] as double)
                                                  .number,
                                        },
                                        {
                                          "label": "Floating return",
                                          "value": (summary["floating_return"]
                                                  as double)
                                              .number,
                                        },
                                        {
                                          "label": "Fund Alloc",
                                          "value":
                                              (summary["fund_alloc"] as double)
                                                  .percentage,
                                        },
                                        {
                                          "label": "Value Effect",
                                          "value": (summary["value_effect"]
                                                  as double)
                                              .percentage,
                                        },
                                        {
                                          "label": "Sekuritas",
                                          "value": item["sekuritas"],
                                        },
                                      ];
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1.0 / 0.4,
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 0,
                                        ),
                                        itemCount: values.length,
                                        physics: ScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "${values[index]["label"]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontSize: 10.0,
                                                  ),
                                                ),
                                                Text(
                                                  "${values[index]["value"]}",
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
                                      );
                                    }),
                                  Row(
                                    children: [
                                      Spacer(),
                                      if (portofolioMode) ...[
                                        Container(
                                          height: 24.0,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey[600],
                                              foregroundColor: Colors.white,
                                            ),
                                            onPressed: () {
                                              Get.to(TradeHistoyView(
                                                stock: item,
                                              ));
                                            },
                                            child: const Text(
                                              "History",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12.0,
                                        ),
                                      ],
                                      Container(
                                        height: 24.0,
                                        child: ElevatedButton(
                                          style: UserBalanceService.sisaSaldo <=
                                                  0
                                              ? ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.grey,
                                                  foregroundColor:
                                                      Colors.grey[600],
                                                )
                                              : ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  foregroundColor: Colors.white,
                                                ),
                                          onPressed: () async {
                                            if (UserBalanceService.sisaSaldo <=
                                                0) return;
                                            await Get.to(PortofolioTradeView(
                                              item: item,
                                            ));
                                            controller.reload();
                                          },
                                          child: const Text(
                                            "Buy",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (portofolioMode) ...[
                                        const SizedBox(
                                          width: 12.0,
                                        ),
                                        Container(
                                          height: 24.0,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                            ),
                                            onPressed: () async {
                                              await Get.to(PortofolioTradeView(
                                                item: item,
                                                sellMode: true,
                                              ));
                                              controller.reload();
                                            },
                                            child: const Text(
                                              "Sell",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
        ),
      ],
    );
  }

  @override
  State<StockListView> createState() => StockListController();
}
