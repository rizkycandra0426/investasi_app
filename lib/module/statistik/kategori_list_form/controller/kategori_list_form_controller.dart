import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class KategoriListFormController extends State<KategoriListFormView> {
  static late KategoriListFormController instance;
  late KategoriListFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    userBudget = getBudget(
      name: view.item.namaKategoriPengeluaran!,
      month: StatistikDashboardController.instance.currentDate.month.toString(),
      year: StatistikDashboardController.instance.currentDate.year.toString(),
    );
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  double userBudget = 0;
}
