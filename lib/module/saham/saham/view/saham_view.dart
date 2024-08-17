import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/saham/stock_list/view/stock_list_view.dart';
import 'package:hyper_ui/service/offline_service.dart';
import '../controller/saham_controller.dart';

class SahamView extends StatefulWidget {
  const SahamView({Key? key}) : super(key: key);

  Widget build(context, SahamController controller) {
    controller.view = this;
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            "Portofolio Saham",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.data_array),
              onPressed: () async {
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

                var stockIndex = StockNewService.stocks
                    .indexWhere((i) => i["id_saham"] == "2");
                Map<String, dynamic> stock = StockNewService.stocks[stockIndex];

                printo(stock);

                StockNewService.stocks[stockIndex]["buy_volume"] += 1000;
                StockNewService.buy(
                  idSaham: "2",
                  price: 1000,
                  volume: 1000,
                  stock: stock,
                );

                StockNewService.stocks[stockIndex]["sell_volume"] += 500;
                StockNewService.sell(
                  idSaham: "2",
                  price: 1251,
                  volume: 500,
                  stock: stock,
                );

                StockNewService.stocks[stockIndex]["buy_volume"] += 1000;
                StockNewService.buy(
                  idSaham: "2",
                  price: 2000,
                  volume: 1000,
                  stock: stock,
                );

                StockNewService.stocks[stockIndex]["buy_volume"] += 1000;
                StockNewService.buy(
                  idSaham: "2",
                  price: 3000,
                  volume: 1000,
                  stock: stock,
                );

                StockNewService.calculate();

                hideLoading();
                Navigator.pop(context);
                Get.to(SahamView());
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                showLoading();
                await reloadPortofolio();
                hideLoading();
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_forever_sharp),
              onPressed: () async {
                StockNewService.stocks = [];
                StockNewService.tradeHistories = [];
                UserBalanceService.topupHistories = [];
                StockNewService.getStockFromDummies();
                OfflineService.saveLocalValues();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
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
    );
  }

  @override
  State<SahamView> createState() => SahamController();
}
