import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/core.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../controller/laporan_keuangan_kalender_controller.dart';

class LaporanKeuanganKalenderView extends StatefulWidget {
  const LaporanKeuanganKalenderView({Key? key}) : super(key: key);

  Widget build(context, LaporanKeuanganKalenderController controller) {
    controller.view = this;
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(showAgenda: true),
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
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: LaporanKeuanganHarianView(
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
    );
  }

  @override
  State<LaporanKeuanganKalenderView> createState() =>
      LaporanKeuanganKalenderController();
}
