import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_categories_by_month_and_year_response.dart';

class StatistikPengeluaranController extends State<StatistikPengeluaranView> {
  static late StatistikPengeluaranController instance;
  late StatistikPengeluaranView view;

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

  TransactionCategoriesByYearResponse? response;
  bool loading = true;
  List items = [];
  getHistories({
    int? month,
    int? year,
  }) async {
    if (!mounted) return;
    loading = true;
    setState(() {});

    response = await TransactionHistoryService().categoriesByMonthAndYear(
      month: month ?? DateTime.now().month,
      year: year ?? DateTime.now().year,
    );

    items = [];
    for (var item in response!.data!) {
      items.add({
        "label": item.namaKategoriPengeluaran,
        "total": item.total,
      });
    }
    loading = false;
    setState(() {});
  }
}
