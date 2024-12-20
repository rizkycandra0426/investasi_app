import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/core.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class LaporanKeuanganKalenderView extends StatefulWidget {
  LaporanKeuanganKalenderView({Key? key}) : super(key: key);

  Widget build(context, LaporanKeuanganKalenderController controller) {
    controller.view = this;
    var dashboardController = DashboardController.instance;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                SfCalendar(
                  view: CalendarView.month,
                  initialDisplayDate: dashboardController.currentDate,
                  monthViewSettings: MonthViewSettings(showAgenda: true),
                  monthCellBuilder: (context, details) {
                    bool displayMarker = false;
                    if (controller.response != null) {
                      var find = controller.response!.data!.indexWhere(
                        (e) {
                          var date = e.tanggal!;
                          return date.day == details.date.day &&
                              date.month == details.date.month &&
                              date.year == details.date.year;
                        },
                      );
                      if (find > -1) {
                        displayMarker = true;
                      }
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
                if (controller.loading)
                  Center(
                    child: Container(
                      width: 160.0,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 0.5,
                                child: CircularProgressIndicator(),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                "Load data ...",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              )
                            ],
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
  State<LaporanKeuanganKalenderView> createState() =>
      LaporanKeuanganKalenderController();
}
