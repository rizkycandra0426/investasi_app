import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/controller/dashboard_controller.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/laporan_keuangan_harian/view/laporan_keuangan_harian_view.dart';
import 'package:hyper_ui/shared/widget/loading/loading_scaffold.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../controller/laporan_keuangan_kalender_controller.dart';

class LaporanKeuanganKalenderView extends StatefulWidget {
  LaporanKeuanganKalenderView({Key? key}) : super(key: key);

  Widget build(context, LaporanKeuanganKalenderController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    var items = controller.response!.data!;

    var dashboardController = DashboardController.instance;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SfCalendar(
              view: CalendarView.month,
              initialDisplayDate: dashboardController.currentDate,
              monthViewSettings: MonthViewSettings(showAgenda: true),
              monthCellBuilder: (context, details) {
                bool displayMarker = false;
                var find = controller.response!.data!.indexWhere((e) =>
                    DateTime.parse(e.createdAt!).day == details.date.day &&
                    DateTime.parse(e.createdAt!).month == details.date.month &&
                    DateTime.parse(e.createdAt!).year == details.date.year);
                if (find > -1) {
                  displayMarker = true;
                }
                return Container(
                  padding: EdgeInsets.all(4.0),
                  height: 60.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[200]!,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Text(
                        "${details.date.day}",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      if (displayMarker)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Icon(
                            Icons.circle,
                            size: 10.0,
                            color: infoColor,
                          ),
                        ),
                    ],
                  ),
                );
              },
              onTap: (e) async {
                await showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: LaporanKeuanganHarianView(
                            key: UniqueKey(),
                            enableAppBar: true,
                            date: e.date,
                          ).animate().move().fadeIn(),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<LaporanKeuanganKalenderView> createState() =>
      LaporanKeuanganKalenderController();
}
