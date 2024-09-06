import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/buy_deposito_view.dart';

class BuyDepositoController extends State<BuyDepositoView> {
  static late BuyDepositoController instance;
  late BuyDepositoView view;

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
  String namaBank = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  save() async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }
    TRX.topup(
      date: now,
      amount: amount,
      type: TopupType.buyDeposito,
      namaBank: namaBank,
    );
    Get.back();
  }
}
