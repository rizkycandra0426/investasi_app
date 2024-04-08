import 'package:flutter/material.dart';

class DashboardCardIncome extends StatelessWidget {
  final String value;
  DashboardCardIncome({
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
            Icons.arrow_downward,
            size: 24,
            color: Colors.blue,
          ),
          margin: const EdgeInsets.only(
            right: 8,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pemasukan",
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
