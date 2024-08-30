import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/main.dart';
import '../controller/trade_histoy_controller.dart';

class TradeHistoyView extends StatefulWidget {
  const TradeHistoyView({
    Key? key,
    required this.stock,
  }) : super(key: key);
  final Map<String, dynamic> stock;

  Widget build(context, TradeHistoyController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              stock["pic"],
              width: 16.0,
              height: 16.0,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.network(
                  "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                  width: 16.0,
                  height: 16.0,
                  fit: BoxFit.fill,
                );
              },
            ),
            const SizedBox(
              width: 6.0,
            ),
            Text("${stock["nama_saham"]}"),
            const SizedBox(
              width: 6.0,
            ),
            Text("Trade Histories"),
          ],
        ),
        actions: const [],
      ),
      body: Builder(builder: (context) {
        var items = StockNewService.tradeHistories;
        items.sort((a, b) {
          return DateTime.parse(b["date"]).compareTo(DateTime.parse(a["date"]));
        });
        return ListView.builder(
          padding: const EdgeInsets.all(12.0),
          itemCount: items.length,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int tradeIndex) {
            var tradeHistory = items[tradeIndex];
            if (tradeHistory["nama_saham"] != stock["nama_saham"]) {
              return const SizedBox.shrink();
            }

            return Container(
              margin: const EdgeInsets.only(
                bottom: 0.0,
              ),
              child: Builder(builder: (context) {
                bool devMode = false;
                List values = [
                  {
                    "label": "Date",
                    "value": DateTime.parse(tradeHistory["date"]).dMMMy,
                  },
                  {
                    "label": "Volume",
                    "value": tradeHistory["volume"],
                  },
                  {
                    "label": "Price",
                    "value": tradeHistory["price"],
                  },
                  // {
                  //   "label": "Average",
                  //   "value": tradeHistory["average"] ?? 0,
                  // },
                  {
                    "label": "Total",
                    "value": tradeHistory["total"],
                  },
                  {
                    "label": "Sekuritas",
                    "value": tradeHistory["stock"]["sekuritas"],
                  },
                  {
                    "label": "Action",
                    "value": tradeHistory["action"],
                    "color": tradeHistory["action"] == "BUY"
                        ? Colors.blue
                        : Colors.red,
                  },
                  //-----------
                  if (isDeveloper) ...[
                    {
                      "label": "Buying Price",
                      "value": tradeHistory["buying_price"],
                      "devmode": true,
                    },
                    {
                      "label": "Avg Price",
                      "value": tradeHistory["avg_price"],
                      "devmode": true,
                    },
                    {
                      "label": "Current Price",
                      "value": tradeHistory["current_price"],
                      "devmode": true,
                    },
                    // {
                    //   "label": "Selling Price",
                    //   "value": tradeHistory["selling_price"],
                    // },
                    {
                      "label": "Cost",
                      "value": tradeHistory["action"] == "SELL"
                          ? "-"
                          : tradeHistory["cost"],
                      "devmode": true,
                    },
                    {
                      "label": "Valuation",
                      "value": tradeHistory["valuation"],
                      "devmode": true,
                    },
                    {
                      "label": "Floating Return",
                      "value": tradeHistory["action"] == "SELL"
                          ? "-"
                          : tradeHistory["floating_return"],
                      "devmode": true,
                    },
                    {
                      "label": "fund_alloc",
                      "value": (tradeHistory["fund_alloc"] * 1.0 as double)
                          .percentage,
                      "devmode": true,
                    },
                    {
                      "label": "value_effect",
                      "value": (tradeHistory["value_effect"] * 1.0 as double)
                          .percentage,
                      "devmode": true,
                    },
                  ],
                ];

                bool isSell = tradeHistory["action"] == "SELL";
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GridView.builder(
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
                                itemBuilder: (BuildContext context, int index) {
                                  var value = values[index]["value"].toString();

                                  if (values[index]["suffix"] == "%") {
                                    value = double.parse(
                                            values[index]["value"].toString())
                                        .toStringAsFixed(2);
                                  } else if (values[index]["value"] is double) {
                                    value = double.parse(
                                            values[index]["value"].toString())
                                        .number;
                                  }
                                  value =
                                      value + (values[index]["suffix"] ?? "");

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: values[index]["devmode"] == true
                                          ? Colors.orange[200]
                                          : Colors.transparent,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${values[index]["label"]}",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: values[index]["color"],
                                          ),
                                        ),
                                        Text(
                                          value,
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: values[index]["color"],
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
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        );
      }),
    );
  }

  @override
  State<TradeHistoyView> createState() => TradeHistoyController();
}
