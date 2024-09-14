import 'package:flutter/foundation.dart';
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

    // return Scaffold(
    //   body: SimpleTabbar(
    //     items: [
    //       SimpleTabbarItem(
    //         label: "Portofolio",
    //         icon: MdiIcons.listBox,
    //         view: PortofolioNewView(),
    //       ),
    //       SimpleTabbarItem(
    //         label: "Stock",
    //         icon: MdiIcons.listBoxOutline,
    //         view: StockListView(
    //           portofolioMode: false,
    //         ),
    //       ),
    //       SimpleTabbarItem(
    //         label: "Log",
    //         icon: MdiIcons.bug,
    //         view: DemoSahamView(),
    //       ),
    //     ],
    //   ),
    // );
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              if (kDebugMode) {
                Get.to(DemoSahamView());
              }
            },
            child: Text("Saham"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
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
