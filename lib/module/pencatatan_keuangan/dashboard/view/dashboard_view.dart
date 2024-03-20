import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/controller/dashboard_controller.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/widget/dashboard_card.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/widget/dashboard_clippath.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_bulanan/view/laporan_keuangan_bulanan_view.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_harian/view/laporan_keuangan_harian_view.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_kalender/view/laporan_keuangan_kalender_view.dart';

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
        key: Key("key_${controller.counter}"),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ClipPath(
              clipper: DashboardCardClipPath(),
              child: Container(
                height: 400,
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
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: DefaultTabController(
                          length: 3,
                          initialIndex: controller.selectedIndex,
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
