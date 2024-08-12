// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class PinjamanIndexedValueItem extends StatelessWidget {
  final dynamic number;
  final String angsuran;
  final String totalAngsuran;
  final dynamic sisaPinjaman;

  const PinjamanIndexedValueItem({
    super.key,
    required this.number,
    required this.angsuran,
    required this.totalAngsuran,
    required this.sisaPinjaman,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      child: Row(
        children: [
          Container(
            width: 32.0,
            child: Text(
              "$number",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$angsuran",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$totalAngsuran",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$sisaPinjaman",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
