import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/transaction_categories_by_month_and_year_response.dart';
import '../view/kategori_list_view.dart';

class KategoriListController extends State<KategoriListView> {
  static late KategoriListController instance;
  late KategoriListView view;

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
