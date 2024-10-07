import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_month_and_year_response.dart';

class LaporanKeuanganKalenderController
    extends State<LaporanKeuanganKalenderView> {
  static late LaporanKeuanganKalenderController instance;
  late LaporanKeuanganKalenderView view;

  @override
  void initState() {
    instance = this;
    super.initState();

    var dashboardController = DashboardController.instance;
    getHistories(
      month: dashboardController.currentDate.month,
      year: dashboardController.currentDate.year,
    );
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  TransactionByMonthAndYearResponse? response;
  bool loading = true;
  getHistories({
    int? month,
    int? year,
  }) async {
    if (!mounted) return;
    print("getHistories... $month/$year");
    loading = true;

    if (mounted) setState(() {});

    await Future.delayed(Duration(seconds: 2));

    response = await TransactionHistoryService().byMonthAndYear(
      month: month ?? DateTime.now().month,
      year: year ?? DateTime.now().year,
    );
    print("data length: ${response!.data!.length}");
    calculateTotal();

    loading = false;
    if (mounted) setState(() {});
  }

  calculateTotal() {
    double pemasukan = 0;
    double pengeluaran = 0;
    for (var item in response!.data!) {
      if (item.type == "Pemasukan") {
        pemasukan += item.jumlah!;
      } else {
        pengeluaran += item.jumlah!;
      }
    }

    DashboardController.instance.balance = pemasukan - pengeluaran;
    DashboardController.instance.pemasukan = pemasukan;
    DashboardController.instance.pengeluaran = pengeluaran;
    DashboardController.instance.setState(() {});
  }

  List<Meeting> getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}
