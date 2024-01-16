import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PengeluaranItem extends StatelessWidget {
  PengeluaranItem({
    super.key,
    required this.label,
    required this.total,
    this.enablePercentage = false,
    this.budget,
    required this.index,
  });

  final double total;
  final double? budget;
  final String label;
  final bool enablePercentage;
  final int index;

  @override
  Widget build(BuildContext context) {
    double progressPercentage = 0;
    double percent = 0;

    if (budget != null) {
      percent = (total / budget!) * 100;
      progressPercentage = percent / 100;
    }
    return Container(
      color: index % 2 == 0 ? Colors.grey[300] : Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        children: [
          if (budget != null && budget != 0 && enablePercentage)
            Container(
              width: MediaQuery.of(context).size.width,
              height: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: LinearProgressIndicator(
                      value: progressPercentage,
                      backgroundColor: Colors.grey[300],
                      color: percent < 100 ? Colors.blue : Colors.red,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${percent.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 6.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              if (budget != null)
                Text(
                  "${NumberFormat().format(total)}${(budget == null || budget == 0) ? '' : '/${NumberFormat().format(budget ?? 0)}'}",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              if (budget == null)
                Text(
                  "${NumberFormat().format(total)}",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
