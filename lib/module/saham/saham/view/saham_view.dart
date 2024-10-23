import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class SahamView extends StatefulWidget {
  const SahamView({Key? key}) : super(key: key);

  Widget build(context, SahamController controller) {
    controller.view = this;

    if (controller.loading) return LoadingScaffold();

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
          actions: [
            GestureDetector(
              onTap: () async {
                bool confirmed = await showConfirmationDialog();
                if (confirmed) {
                  TRX.cleanData();
                  PortofolioNewController.instance.reload();
                  controller.reload();
                }
              },
              onDoubleTap: () async {
                bool confirmed = await showConfirmationDialog();
                if (confirmed) {
                  TRX.generateCustomDummies();
                  PortofolioNewController.instance.reload();
                  controller.reload();
                }
              },
              child: Icon(
                Icons.delete_forever,
                size: 20.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
          ],
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
