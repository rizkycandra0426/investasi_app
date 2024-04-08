import 'package:flutter/material.dart';

class DashboardCardExpense extends StatelessWidget {
  final String value;
  DashboardCardExpense({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          padding: const EdgeInsets.all(
            6,
          ),
          child: Icon(
            Icons.arrow_upward,
            size: 24,
            color: Colors.red[700],
          ),
          margin: const EdgeInsets.only(
            right: 8,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pengeluaran",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
