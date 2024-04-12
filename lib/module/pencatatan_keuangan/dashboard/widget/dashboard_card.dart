// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/controller/dashboard_controller.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/widget/dashboard_card_expense.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/widget/dashboard_card_income.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = DashboardController.instance;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        right: 28,
        left: 28,
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/card_new.png'), // Ganti dengan nama file gambar Anda
            fit: BoxFit.cover, // Atur gambar agar memenuhi container
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white24,
              blurRadius: 30,
              offset: Offset(0, 11),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(
              24.0,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                24.0,
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'Total Balance',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${NumberFormat().format(controller.balance)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardCardIncome(
                      value: '${NumberFormat().format(controller.pemasukan)}',
                    ),
                    DashboardCardExpense(
                      value: '${NumberFormat().format(controller.pengeluaran)}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
