import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hyper_ui/core.dart';

class PortofolioEditPriceView extends StatefulWidget {
  final History item;
  const PortofolioEditPriceView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, PortofolioEditPriceController controller) {
    controller.view = this;

    var loadingWidget = Center(
      child: Text("Load realtime data..."),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Edit current price: ${item.target}"),
        actions: const [],
      ),
      body: controller.loading
          ? loadingWidget
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    QNumberField(
                      label: "Current Price",
                      validator: Validator.required,
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
                              "https://id.tradingview.com/symbols/IDX-${item.target}/"),
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
                    )
                  ],
                ),
              ),
            ),
      bottomNavigationBar: QActionButton(
        color: Colors.blue,
        label: "Save",
        onPressed: () => controller.save(),
      ),
    );
  }

  @override
  State<PortofolioEditPriceView> createState() =>
      PortofolioEditPriceController();
}
