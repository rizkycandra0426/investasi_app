import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/saldo_service.dart';

class BalanceWidget extends StatefulWidget {
  final bool enableTopup;
  const BalanceWidget({
    super.key,
    this.enableTopup = true,
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
      mainAxisAlignment: widget.enableTopup
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Saldo:",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              "${currentUserSaldo.currency}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        if (widget.enableTopup) ...[
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
                size: 12.0,
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () async {
              await Get.to(HistoriDanaView());
              loadData();
            },
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 12.0,
              child: Icon(
                Icons.history,
                color: Colors.white,
                size: 12.0,
              ),
            ),
          ),
          const SizedBox(
            width: 6.0,
          ),
          InkWell(
            onTap: () async {
              await Get.to(HistoriIhsgView());
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 12.0,
              child: Icon(
                Icons.stacked_line_chart,
                color: Colors.white,
                size: 12.0,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
