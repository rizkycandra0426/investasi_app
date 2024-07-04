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

                // Lakukan perhitungan investasi untuk mencapai target secara iteratif
                double monthlyInterestRate = persentase / 100 / 12;
                int months = years * 12;
                double totalMultiplier = 1.0;
                for (int i = 0; i < months; i++) {
                  totalMultiplier *= (1 + monthlyInterestRate);
                }
                double monthlyContribution = targetValue /
                    ((((totalMultiplier - 1) / monthlyInterestRate)) *
                        (1 + monthlyInterestRate));

                controller.hasil = monthlyContribution;

                // Total Dana per bulan tanpa bunga
                double totalDanaPerBulan = monthlyContribution;

                return ValueItem(
                  label: "Total Dana per Bulan",
                  value: "${totalDanaPerBulan.currency}",
                );
              }),
              Builder(builder: (context) {
                var targetValue = controller.investasiAwal;
                var persentase = controller.persentaseBunga;
                var years = controller.jangkaWaktuDalamTahun;

                // Lakukan perhitungan investasi untuk mencapai target secara iteratif
                double monthlyInterestRate = persentase / 100 / 12;
                int months = years * 12;
                double totalMultiplier = 1.0;
                for (int i = 0; i < months; i++) {
                  totalMultiplier *= (1 + monthlyInterestRate);
                }
                double monthlyContribution = targetValue /
                    ((((totalMultiplier - 1) / monthlyInterestRate)) *
                        (1 + monthlyInterestRate));

                controller.hasil = monthlyContribution;

                // Hitung nilai investasi setelah bunga
                double nilaiInvestasi = 0.0;
                double currentAmount = 0.0;
                for (int i = 0; i < months; i++) {
                  currentAmount += monthlyContribution;
                  currentAmount += currentAmount * monthlyInterestRate;
                  nilaiInvestasi += currentAmount * monthlyInterestRate;
                }

                return ValueItem(
                  label: "Nilai Investasi",
                  value: "${(nilaiInvestasi).currency}",
                );
              }),
              Builder(builder: (context) {
                var totalDanaPerBulan = controller.hasil;
                var persentase = controller.persentaseBunga;
                var years = controller.jangkaWaktuDalamTahun;

                double monthlyInterestRate = persentase / 100 / 12;
                int months = years * 12;

                double nilaiInvestasi = 0.0;
                double currentAmount = 0.0;

                for (int i = 0; i < months; i++) {
                  currentAmount += totalDanaPerBulan;
                  currentAmount += currentAmount * monthlyInterestRate;
                  nilaiInvestasi += currentAmount;
                }

                double totalNilai = currentAmount;

                return ValueItem(
                  label: "Total Nilai",
                  value: "${totalNilai.currency}",
                );
              }),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.grey[400],
                child: IndexedValueItem(
                  number: "Tahun",
                  label: "Investasi",
                  value: "Nilai Investasi",
                ),
              ),
              ListView.builder(
                itemCount: controller.jangkaWaktuDalamTahun,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var principal = controller.investasiAwal;
                  var monthlyInterestRate =
                      controller.persentaseBunga / 100 / 12;
                  var months = (index + 1) * 12;

                  var nilaiInvestasi = principal;
                  for (int i = 0; i < months; i++) {
                    var profit = nilaiInvestasi * monthlyInterestRate;
                    nilaiInvestasi += profit;
                  }

                  return Container(
                    padding: const EdgeInsets.all(6.0),
                    color: index % 2 == 0 ? Colors.grey[300] : Colors.grey[200],
                    child: IndexedValueItem(
                      number: index + 1,
                      label: "${(controller.investasiAwal).currency}",
                      value: "${nilaiInvestasi.currency}",
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
