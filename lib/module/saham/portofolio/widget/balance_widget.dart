import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

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
  }

  @override
  Widget build(BuildContext context) {
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
              "${UserBalanceService.sisaSaldo.currency}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
        if (widget.enableTopup) ...[
          const SizedBox(
            width: 5.0,
          ),
          Container(
            height: 24.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                await Get.to(TopupView());
                PortofolioNewController.instance.reload();
                setState(() {});
              },
              child: const Text(
                "Topup",
                style: TextStyle(
                  fontSize: 8.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Container(
            height: 24.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                await Get.to(TopupView(
                  topupMode: false,
                ));
                PortofolioNewController.instance.reload();
                setState(() {});
              },
              child: const Text(
                "Withdraw",
                style: TextStyle(
                  fontSize: 8.0,
                ),
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () async {
              await Get.to(HistoriDanaView(
                depositoMode: false,
              ));
              PortofolioNewController.instance.reload();
              setState(() {});
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
