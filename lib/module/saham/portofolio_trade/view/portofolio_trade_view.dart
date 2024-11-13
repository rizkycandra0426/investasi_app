import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hyper_ui/core.dart';

class PortofolioTradeView extends StatefulWidget {
  final bool sellMode;
  final bool editMode;
  final History? editItem;
  final String namaSaham;
  const PortofolioTradeView({
    Key? key,
    this.sellMode = false,
    this.editMode = false,
    this.editItem,
    required this.namaSaham,
  }) : super(key: key);

  Widget build(context, PortofolioTradeController controller) {
    controller.view = this;
    bool buyMode = !sellMode;

    var loadingWidget = Center(
      child: Text("Load realtime data..."),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: buyMode ? Colors.green : Colors.red,
        title: Text("${buyMode ? "Buy" : "Sell"} $namaSaham"),
        actions: [
          InkWell(
            onTap: () async {
              controller.loading = true;
              controller.reload();

              controller.date = DateTime(now.year + 1, 1, 1);
              controller.price = 1000;
              controller.volume = 1000;

              await Future.delayed(Duration(milliseconds: 100));
              controller.loading = false;
              controller.reload();
            },
            child: Center(
              child: Text(
                "2025",
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
      ),
      body: controller.loading
          ? loadingWidget
          : SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      QNumberField(
                        label: "Price",
                        validator: Validator.multipleOf100,
                        value: controller.price.toString(),
                        onChanged: (value) {
                          controller.price = double.tryParse(value) ?? 0;
                        },
                      ),
                      QButton(
                        label: "Use Realtime Price",
                        color: Colors.grey,
                        onPressed: () => controller.useRealtimePrice(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1.0,
                        child: InAppWebView(
                          initialUrlRequest: URLRequest(
                            url: Uri.parse(
                                "https://id.tradingview.com/symbols/IDX-${namaSaham}/"),
                          ),
                          onLoadStop: (webController, url) {
                            print("onLoadStop $url");
                            // get html of #js-category-content > div.tv-react-category-header > div.js-symbol-page-header-root > div > div.symbolRow-OJZRoKx6.hideTabs-OJZRoKx6 > div > div.quotesRow-pAUXADuj > div:nth-child(1) > div > div.lastContainer-JWoJqCpY > span.last-JWoJqCpY.js-symbol-last > span?
                            webController.evaluateJavascript(source: """
                            var price = document.querySelector("#js-category-content > div.tv-react-category-header > div.js-symbol-page-header-root > div > div.symbolRow-OJZRoKx6.hideTabs-OJZRoKx6 > div > div.quotesRow-pAUXADuj > div:nth-child(1) > div > div.lastContainer-JWoJqCpY > span.last-JWoJqCpY.js-symbol-last > span").innerText;
                            price;
                          """).then((value) {
                              print("value: $value");
                              if (value != null) {
                                controller.realtimePrice =
                                    double.tryParse(value) ?? 0.0;
                                //MEMEFI
                                //MAJOR
                                //TOMARKET
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      QDatePicker(
                        label: "Date",
                        validator: Validator.required,
                        value: controller.date,
                        onChanged: (value) {
                          print("value: $value");
                          controller.date = value;
                        },
                      ),
                      QNumberField(
                        label: "Volume",
                        validator: Validator.multipleOf100,
                        value: controller.volume.toString(),
                        onChanged: (value) {
                          controller.volume = int.tryParse(value) ?? 0;
                          controller.reload();
                        },
                      ),
                      AbsorbPointer(
                        child: QNumberField(
                          key: Key("${controller.volume}"),
                          label: "Total",
                          validator: Validator.required,
                          value: controller.total.toString(),
                          onChanged: (value) {},
                        ),
                      ),
                      QDropdownField(
                        label: "Sekuritas",
                        validator: Validator.required,
                        items: [
                          {
                            "label": "Ajaib",
                            "value": "Ajaib",
                          },
                          {
                            "label": "Bibit",
                            "value": "Bibit",
                          },
                          {
                            "label": "Stockbit",
                            "value": "Stockbit",
                          },
                          {
                            "label": "IPOT",
                            "value": "IPOT",
                          },
                          {
                            "label": "RTI Business",
                            "value": "RTI Business",
                          }
                        ],
                        value: controller.sekuritas,
                        onChanged: (value, label) {
                          controller.sekuritas = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: controller.loading
          ? null
          : QActionButton(
              color: buyMode ? Colors.green : Colors.red,
              label: buyMode ? "Buy" : "Sell",
              onPressed: () => controller.trade(),
            ),
    );
  }

  @override
  State<PortofolioTradeView> createState() => PortofolioTradeController();
}
