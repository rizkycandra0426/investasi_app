// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class TargetDetail extends StatelessWidget {
  const TargetDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TargetInvestasiController.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Investasi"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ValueItem(
                label: "Target Dana",
                value: "${controller.investasiAwal.currency}",
              ),
              ValueItem(
                label: "Jangka Waktu",
                value: "${controller.jangkaWaktuDalamTahun} tahun",
              ),
              ValueItem(
                label: "Persentase Bunga",
                value: "${controller.persentaseBunga.percentage}",
              ),
              Builder(builder: (context) {
                var targetValue = controller.investasiAwal;
                var persentase = controller.persentaseBunga;
                var years = controller.jangkaWaktuDalamTahun;

                // Menghitung tingkat bunga bulanan
                double monthlyInterestRate = persentase / 100 / 12;
                int months = years * 12;

                // Menghitung kontribusi bulanan menggunakan rumus anuitas secara iteratif
                double totalMultiplier = 1.0;
                for (int i = 0; i < months; i++) {
                  totalMultiplier *= (1 + monthlyInterestRate);
                }

                double monthlyContribution =
                    (targetValue * monthlyInterestRate) /
                        (1 - 1 / totalMultiplier);

                controller.hasil = monthlyContribution;

                // Total Dana per bulan dengan bunga sudah termasuk dalam monthlyContribution
                double totalDanaPerBulan = monthlyContribution;

                return ValueItem(
                  label: "Total Dana per Bulan",
                  value:
                      "${totalDanaPerBulan.currency}", // Format dengan dua desimal
                );
              }),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.grey[400],
                child: IndexedValueItem(
                  number: "Bulan",
                  label: "Dana Per Bulan",
                  value: "Nilai Investasi",
                ),
              ),
              ListView.builder(
                itemCount:
                    controller.jangkaWaktuDalamTahun * 12, // Menggunakan bulan
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  // Nilai tetap untuk dana per bulan
                  double monthlyContribution = controller.hasil;

                  // Menghitung nilai investasi bulanan secara iteratif
                  double monthlyInterestRate =
                      controller.persentaseBunga / 100 / 12;
                  double nilaiInvestasi = 0.0;
                  double currentAmount = 0.0;

                  for (int i = 0; i <= index; i++) {
                    currentAmount += monthlyContribution;
                    currentAmount += currentAmount * monthlyInterestRate;
                  }
                  nilaiInvestasi = currentAmount;

                  // Menggunakan NumberFormat untuk format mata uang
                  final formatCurrency =
                      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

                  return Container(
                    padding: const EdgeInsets.all(6.0),
                    color: index % 2 == 0 ? Colors.grey[300] : Colors.grey[200],
                    child: IndexedValueItem(
                      number: index + 1,
                      label: formatCurrency.format(monthlyContribution),
                      value: formatCurrency.format(nilaiInvestasi),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ValueItem extends StatelessWidget {
  final String label;
  final dynamic value;
  const ValueItem({
    super.key,
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
          Expanded(
            child: Text(
              "$label",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          Text(
            "$value",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class IndexedValueItem extends StatelessWidget {
  final dynamic number;
  final String label;
  final dynamic value;

  const IndexedValueItem({
    super.key,
    required this.number,
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
            width: 40.0,
            child: Text(
              "$number",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$label",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$value",
              textAlign: TextAlign.center,
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