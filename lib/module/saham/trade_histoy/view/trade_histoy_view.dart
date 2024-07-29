import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
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
        title: Text("Trade History: ${stock["nama_saham"]}"),
        actions: const [],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: StockNewService.tradeHistories.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int tradeIndex) {
          var tradeHistory = StockNewService.tradeHistories[tradeIndex];
          return Card(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              child: Builder(builder: (context) {
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
                ];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          stock["pic"],
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
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
                          height: 4.0,
                        ),
                        Text(stock["nama_saham"]),
                      ],
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                            value =
                                double.parse(values[index]["value"].toString())
                                    .toStringAsFixed(2);
                          } else if (values[index]["value"] is double) {
                            value =
                                double.parse(values[index]["value"].toString())
                                    .number;
                          }
                          value = value + (values[index]["suffix"] ?? "");
                          return Container(
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
                );
              }),
            ),
          );
        },
      ),
    );
  }

  @override
  State<TradeHistoyView> createState() => TradeHistoyController();
}
