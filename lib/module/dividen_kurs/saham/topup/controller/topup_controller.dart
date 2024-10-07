import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class TopupController extends State<TopupView> {
  static late TopupController instance;
  late TopupView view;

  bool isTopupMode = true;
  bool get isWithdrawMode => !isTopupMode;
  String jenisTopup = "Topup Dana";
  String namaBank = "";

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
  String saham = "";

  bool get isTopupDividen {
    return jenisTopup == "Topup Deviden";
  }

  process() async {
    var bankList = TRX.getUniqueNamaBankList();
    if (bankList.isEmpty && jenisTopup == "Topup Deviden Deposito") {
      se("Belum ada transaksi buy deposito");
      return;
    }

    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }
    showLoading();

    if (isTopupMode) {
      if (jenisTopup == "Topup Deviden Saham") {
        TRX.topup(
          date: now,
          amount: amount,
          type: TopupType.devidenSaham,
          saham: saham,
        );
      } else if (jenisTopup == "Topup Deviden Deposito") {
        TRX.topup(
          date: now,
          amount: amount,
          type: TopupType.devidenDeposito,
          namaBank: namaBank,
        );
      } else {
        TRX.topup(
          date: now,
          amount: amount,
          type: TopupType.topupBalance,
        );
      }
    } else {
      TRX.withdraw(
        date: now,
        amount: amount,
      );
    }

    hideLoading();
    Get.back();
    snackbarSuccess(message: "Berhasil topup");
  }

  reload() {
    setState(() {});
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
