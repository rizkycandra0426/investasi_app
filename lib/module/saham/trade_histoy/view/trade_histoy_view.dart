import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/main.dart';
import '../controller/trade_histoy_controller.dart';

class TradeHistoyView extends StatefulWidget {
  const TradeHistoyView({
    Key? key,
    required this.saham,
  }) : super(key: key);
  final String saham;

  Widget build(context, TradeHistoyController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              TRX.getImageFromSaham(saham),
              width: 24.0,
              height: 24.0,
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
            Text("${saham}"),
            const SizedBox(
              width: 6.0,
            ),
            Text("Trade Histories"),
          ],
        ),
        actions: const [],
      ),
      body: Builder(builder: (context) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 12.0,
          ),
          itemCount: TRX.tradeHistories.length,
          itemBuilder: (BuildContext context, int index) {
            var item = TRX.tradeHistories[index];
            if (item.activity == "BUY" && item.target != saham)
              return SizedBox.shrink();
            if (item.activity == "SELL" && item.target != saham)
              return SizedBox.shrink();
            if (item.activity == "TOPUP" && item.targetSaham != saham)
              return SizedBox.shrink();

            // var itemValues = [
            //   {
            //     "label": "Date",
            //     "value": item.date.yMd,
            //   },
            //   {
            //     "label": "Activity",
            //     "value": item.activity,
            //   },
            //   {
            //     "label": "Jumlah Lembar",
            //     "value": item.sisaVolume.number,
            //   },
            //   {
            //     "label": "Current Price",
            //     "value": item.currentPrice.number,
            //   },
            //   {
            //     "label": "Buying Price",
            //     "value": item.buyingPrice.number,
            //   },
            //   {
            //     "label": "Buy Total",
            //     "value": item.equitySahamBerdasarkanVolume.number,
            //   },
            //   {
            //     "label": "Valuation",
            //     "value": item.valuation.number,
            //   },
            //   {
            //     "label": "Floating Return",
            //     "value": item.pl.number,
            //   },
            //   {
            //     "label": "Fund Alloc",
            //     "value": item.fundAlloc.percentage,
            //   },
            //   {
            //     "label": "Value Effect",
            //     "value": item.valueEffect.percentage,
            //   },
            //   {
            //     "label": "Sekuritas",
            //     "value": item.sekuritas,
            //   },
            //   {
            //     "label": "Total",
            //     "value": item.total,
            //   }
            // ];

            var itemValues = [
              {
                "label": "Date",
                "value": item.date.yMd,
              },
              {
                "label": "Volume",
                "value": item.qty.number,
              },
              // {
              //   "label": "Current Price",
              //   "value": item.currentPrice.number,
              // },
              {
                "label": "Price",
                "value": item.price.number,
              },
              {
                "label": "Total",
                // "value": item.equitySahamBerdasarkanVolume.number,
                "value": item.total.number,
              },
              // {
              //   "label": "Valuation",
              //   "value": item.valuation.number,
              // },
              // {
              //   "label": "Floating Return",
              //   "value": item.pl.number,
              // },
              // {
              //   "label": "Fund Alloc",
              //   "value": item.fundAlloc.percentage,
              // },
              // {
              //   "label": "Value Effect",
              //   "value": item.valueEffect.percentage,
              // },
              {
                "label": "Sekuritas",
                "value": item.sekuritas,
              },
              // {
              //   "label": "Total",
              //   "value": item.total,
              // },
              {
                "label": "Activity",
                "value": item.activity,
              },
            ];

            if (item.activity == "TOPUP") {
              //  remove volume key/
              itemValues.removeWhere((element) => element["label"] == "Volume");
              itemValues.removeWhere((element) => element["label"] == "Price");
              itemValues
                  .removeWhere((element) => element["label"] == "Sekuritas");
            }

            return InkWell(
              onTap: () {},
              child: Container(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  TRX.getImageFromSaham(saham),
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
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
                                  height: 6.0,
                                ),
                                Text("${saham}"),
                              ],
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: StaggeredGrid.count(
                                crossAxisCount: 3,
                                children: List.generate(
                                  itemValues.length,
                                  (index) {
                                    var value = itemValues[index];
                                    Color? color = null;

                                    if (value["label"] == "Activity") {
                                      if (value["value"] == "BUY") {
                                        color = Colors.blue;
                                      } else if (value["value"] == "SELL") {
                                        color = Colors.red;
                                      } else if (value["value"] == "TOPUP") {
                                        color = Colors.green;
                                      }
                                    }

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
                                                color: color,
                                              ),
                                            ),
                                            Text(
                                              "${value["value"]}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  @override
  State<TradeHistoyView> createState() => TradeHistoyController();
}
