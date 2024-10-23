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
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$angsuran",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Container(
            width: 100.0,
            child: Text(
              "$totalAngsuran",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Container(
            width: 100.0,
            child: Text(
              "$sisaPinjaman",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
