// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class PengeluaranCard extends StatelessWidget {
  const PengeluaranCard({Key? key, required this.tittle, required this.harga})
      : super(key: key);

  final String tittle;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.grey.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ), // Adds 10 margin on all sides
              child: Text(
                tittle,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                harga,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
