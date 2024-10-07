import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_month_and_year_response.dart';

class CatatanPengeluaranController extends State<CatatanPengeluaranView> {
  static late CatatanPengeluaranController instance;
  late CatatanPengeluaranView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getHistories();
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
    loading = true;
    setState(() {});

    response = await TransactionHistoryService().byMonthAndYear(
      month: month ?? DateTime.now().month,
      year: year ?? DateTime.now().year,
    );

    loading = false;
    setState(() {});
  }
}
