import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_by_month_and_year_response.dart';
import 'package:hyper_ui/model/transaction_categories_by_month_and_year_response.dart';
import 'package:hyper_ui/service/budget_service.dart';
import '../view/anggaran_pengeluaran_view.dart';

class AnggaranPengeluaranController extends State<AnggaranPengeluaranView> {
  static late AnggaranPengeluaranController instance;
  late AnggaranPengeluaranView view;

  @override
  void initState() {
    instance = this;
    super.initState();

    var dashboardController = StatistikDashboardController.instance;
    getHistories(
      month: dashboardController.currentDate.month,
      year: dashboardController.currentDate.year,
    );
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
    print("getHistories.... $month/$year");
    if (!this.mounted) return;
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

  double get total {
    double _total = 0;
    for (var item in response!.data!) {
      _total += item.total ?? 0;
    }
    return _total;
  }

  double get totalBudget {
    double _total = 0;
    for (var item in response!.data!) {
      var budget = getBudget(item.namaKategoriPengeluaran!);
      if (budget == 0) continue;
      _total += budget;
    }
    return _total;
  }

  double get sisa {
    return totalBudget - total;
  }
}
