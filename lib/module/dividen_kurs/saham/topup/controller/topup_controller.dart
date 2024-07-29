import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/saldo_service.dart';
import '../view/topup_view.dart';

class TopupController extends State<TopupView> {
  static late TopupController instance;
  late TopupView view;

  bool isTopupMode = true;
  bool get isWithdrawMode => !isTopupMode;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    isTopupMode = widget.topupMode;
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  double amount = 0;

  process() async {
    showLoading();

    if (isTopupMode) {
      await UserBalanceService.topup(amount);
    } else {
      await UserBalanceService.withdraw(amount);
    }

    hideLoading();
    Get.back();
    snackbarSuccess(message: "Berhasil topup");
  }

  reload() {
    setState(() {});
  }
}
