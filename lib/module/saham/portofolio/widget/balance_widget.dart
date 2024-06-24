import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/saldo_service.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({
    super.key,
  });

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await SaldoService().getSaldoUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double balance = DashboardController.instance.balance;
    double saldo = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Saldo: ${currentUserSaldo.currency}",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        InkWell(
          onTap: () async {
            await Get.to(TopupView());
            loadData();
          },
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 12.0,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
