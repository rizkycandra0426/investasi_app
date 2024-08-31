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

            var itemValues = [
              {
                "label": "Date",
                "value": item.date.yMd,
              },
              {
                "label": "Activity",
                "value": item.activity,
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
              },
              {
                "label": "Total",
                "value": item.total,
              }
            ];
            return InkWell(
              onTap: () {},
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
      }),
    );
  }

  @override
  State<TradeHistoyView> createState() => TradeHistoyController();
}
