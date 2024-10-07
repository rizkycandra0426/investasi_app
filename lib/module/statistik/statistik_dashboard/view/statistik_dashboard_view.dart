import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class StatistikDashboardView extends StatefulWidget {
  const StatistikDashboardView({Key? key}) : super(key: key);

  Widget build(context, StatistikDashboardController controller) {
    controller.view = this;
    var now = DateTime.now();
    var datef = DateFormat("MMMM y").format(
      DateTime(now.year, (now.month + controller.counter), 1).add(
        Duration(
          days: controller.counter,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 24.0,
              ),
              onPressed: () => controller.prev(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "$datef",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => controller.next(),
              icon: Icon(
                Icons.arrow_forward,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: StatistikClipPathClass(),
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
          ),
          Container(
            child: Column(
              children: [
                // Container(
                //   height: 200,
                //   decoration: BoxDecoration(
                //     color: Colors.red[100],
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
                    child: Container(
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: controller.selectedIndex,
                        key: Key("key_${controller.counter}"),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      24.0,
                                    ),
                                  ),
                                ),
                                child: TabBar(
                                  indicator: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.blue,
                                  onTap: (index) =>
                                      controller.updateSelectedIndex(index),
                                  tabs: [
                                    Tab(
                                      text: "Statistik",
                                    ),
                                    Tab(
                                      text: "Anggaran",
                                    ),
                                    Tab(
                                      text: "Catatan",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Expanded(
                                child: Container(
                                  child: TabBarView(
                                    children: [
                                      StatistikPengeluaranView(),
                                      AnggaranPengeluaranView(),
                                      CatatanPengeluaranView(),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<StatistikDashboardView> createState() => StatistikDashboardController();
}
