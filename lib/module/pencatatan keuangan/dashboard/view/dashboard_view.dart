import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pencatatan%20keuangan/dashboard/widget/dashboard_card_expense.dart';
import 'package:hyper_ui/module/pencatatan%20keuangan/dashboard/widget/dashboard_card_income.dart';
import 'package:hyper_ui/module/pencatatan%20keuangan/dashboard/widget/dashboard_clippath.dart';
import 'package:hyper_ui/shared/util/animation/animation.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
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
                  "${controller.currentDateFormatted}",
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ClipPath(
              clipper: DashboardCardClipPath(),
              child: Container(
                height: 370,
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 12.0,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    DashboardCard(),
                    SizedBox(
                      height: 22.0,
                    ),
                    Expanded(
                      child: Container(
                        child: DefaultTabController(
                          length: 3,
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
                                    tabs: [
                                      Tab(
                                        text: "Harian",
                                      ),
                                      Tab(
                                        text: "Kalender",
                                      ),
                                      Tab(
                                        text: "Bulanan",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      LaporanKeuanganHarianView(),
                                      LaporanKeuanganKalenderView(),
                                      LaporanKeuanganBulananView(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).amx,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
