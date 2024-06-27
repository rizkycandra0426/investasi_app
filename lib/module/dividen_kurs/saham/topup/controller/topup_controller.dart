import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/saldo_service.dart';
import '../view/topup_view.dart';

class TopupController extends State<TopupView> {
  static late TopupController instance;
  late TopupView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  double amount = 0;
  String catatan = "SAHAM";

  topup() async {
    var balance = DashboardController.instance.balance;

    if (amount > balance) {
      snackbarDanger(message: "Saldo anda tidak mencukupi");
      return;
    }
    showLoading();
    await SaldoService().create({
      "saldo": amount,
    });

    await SaldoService().getSaldoUser();

    hideLoading();
    Get.back();
    snackbarSuccess(message: "Berhasil topup");
  }
}
