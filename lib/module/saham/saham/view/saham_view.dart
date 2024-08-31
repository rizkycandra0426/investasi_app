import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/main.dart';
import 'package:hyper_ui/module/saham/saham/widget/simple_tabbar.dart';
import 'package:hyper_ui/module/saham/stock_list/view/stock_list_view.dart';
import 'package:hyper_ui/service/offline_service.dart';
import '../controller/saham_controller.dart';

class SahamView extends StatefulWidget {
  const SahamView({Key? key}) : super(key: key);

  Widget build(context, SahamController controller) {
    controller.view = this;

    generateDummies({
      bool nextYear = false,
      bool noTradeNextYear = false,
    }) async {
      showLoading();
      StockNewService.stocks = [];
      StockNewService.tradeHistories = [];
      UserBalanceService.topupHistories = [];
      StockNewService.getStockFromDummies();
      OfflineService.saveLocalValues();

      printg("currentStockTotal:::");
      await UserBalanceService.topup(
        100000000,
        false,
      );

      var stockIndex =
          StockNewService.stocks.indexWhere((i) => i["id_saham"] == "2");
      Map<String, dynamic> stock = StockNewService.stocks[stockIndex];

      printo(stock);

      StockNewService.stocks[stockIndex]["buy_volume"] += 1000;
      StockNewService.buy(
        idSaham: "2",
        price: 1000,
        volume: 1000,
        stock: stock,
        date: now,
      );

      StockNewService.stocks[stockIndex]["sell_volume"] += 500;
      StockNewService.sell(
        idSaham: "2",
        price: 1200,
        volume: 500,
        stock: stock,
        date: now,
      );

      StockNewService.stocks[stockIndex]["buy_volume"] += 1000;
      StockNewService.buy(
        idSaham: "2",
        price: 3000,
        volume: 1000,
        stock: stock,
        date: now,
      );

      if (nextYear) {
        await UserBalanceService.topup(
          100000000,
          false,
          DateTime(now.year + 1, 1, 1),
        );

        if (noTradeNextYear == false) {
          StockNewService.stocks[stockIndex]["buy_volume"] += 1000;
          StockNewService.buy(
            idSaham: "2",
            price: 1000,
            volume: 1000,
            stock: stock,
            date: DateTime(now.year + 1, 1, 1),
          );

          StockNewService.stocks[stockIndex]["sell_volume"] += 1000;
          StockNewService.sell(
            idSaham: "2",
            price: 1500,
            volume: 500,
            stock: stock,
            date: DateTime(now.year + 1, 1, 1),
          );
        }

        //Buang lagi nanti yaa
        // await UserBalanceService.topup(
        //   100000000,
        //   false,
        //   DateTime(now.year + 1, 1, 1),
        // );
      }

      StockNewService.calculate();

      hideLoading();
      Navigator.pop(context);
      Get.to(SahamView());
    }

    return Scaffold(
      body: SimpleTabbar(
        items: [
          SimpleTabbarItem(
            label: "Portofolio",
            icon: MdiIcons.listBox,
            view: PortofolioNewView(),
          ),
          SimpleTabbarItem(
            label: "Stock",
            icon: MdiIcons.listBoxOutline,
            view: StockListView(
              portofolioMode: false,
            ),
          ),
          SimpleTabbarItem(
            label: "Log",
            icon: MdiIcons.bug,
            view: DemoSahamView(),
          ),
        ],
      ),
    );
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 24.0,
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          //if can back?
                          Icon(
                            MdiIcons.listBox,
                            size: 24.0,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            "Portofolio",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          MdiIcons.listBoxOutline,
                          size: 24.0,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          "Stock",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              TabBar(
                indicatorColor: Colors.blue,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    child: Text(
                      "Portofolio",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Stock",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    PortofolioNewView(),
                    StockListView(
                      portofolioMode: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<SahamView> createState() => SahamController();
}
