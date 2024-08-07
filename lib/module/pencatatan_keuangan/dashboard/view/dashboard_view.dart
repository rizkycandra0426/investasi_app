import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/controller/dashboard_controller.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/widget/dashboard_card.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/widget/dashboard_clippath.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_bulanan/view/laporan_keuangan_bulanan_view.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_harian/view/laporan_keuangan_harian_view.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_kalender/view/laporan_keuangan_kalender_view.dart';
import 'package:hyper_ui/service/offline_service.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      key: Key("${controller.randomUid}"),
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
      body: Stack(
        children: [
          ClipPath(
            clipper: DashboardCardClipPath(),
            child: Container(
              height: 290,
              width: MediaQuery.of(context).size.width,
              color: primaryColor,
            ),
          ),
          Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                DashboardCard(),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
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
                                  onTap: (index) {
                                    controller.updateSelectedIndex(index);
                                    controller.reload();
                                  },
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
                                key: Key("data_${controller.counter}"),
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
                ),
              ],
            ).amx,
          ),
        ],
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
