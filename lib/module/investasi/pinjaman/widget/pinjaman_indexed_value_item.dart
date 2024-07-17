// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class PinjamanIndexedValueItem extends StatelessWidget {
  final dynamic number;
  final String col1;
  final String label;
  final dynamic value;

  const PinjamanIndexedValueItem({
    super.key,
    required this.number,
    required this.col1,
    required this.label,
    required this.value,
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
              "$col1",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$label",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$value",
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
