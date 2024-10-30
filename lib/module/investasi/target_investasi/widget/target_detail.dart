// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class TargetDetail extends StatelessWidget {
  const TargetDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TargetInvestasiController.instance;

    var targetDana = controller.investasiAwal;
    var persentase = controller.persentaseBunga;
    int months = controller.jangkaWaktuDalamTahun * 12;
    double monthlyInterestRate = persentase / 100 / months;

    // Menghitung kontribusi bulanan menggunakan rumus anuitas secara iteratif
    double totalMultiplier = 1.0;
    for (int i = 0; i < months; i++) {
      totalMultiplier *= (1 + monthlyInterestRate);
    }

    double monthlyContribution =
        (targetDana * monthlyInterestRate) / (1 - 1 / totalMultiplier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Investasi (target)"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TargetDetailValueItem(
                label: "Target Dana",
                value: "${controller.investasiAwal.number}",
              ),
              TargetDetailValueItem(
                label: "Jangka Waktu",
                value: "${controller.jangkaWaktuDalamTahun} tahun",
              ),
              TargetDetailValueItem(
                label: "Persentase Bunga",
                value: "${controller.persentaseBunga}%",
              ),
              Builder(builder: (context) {
                return TargetDetailValueItem(
                  label: "Total Dana per Bulan",
                  value:
                      "${TargetInvestasiController.instance.currentMonthlyDeposit.number}", // Format dengan dua desimal
                );
              }),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.white,
                child: TargetDetailIndexedValueItem(
                  number: "Bulan",
                  label: "Dana Per Bulan",
                  sublabel: "Bunga",
                  value: "Nilai Investasi",
                ),
              ),
              Builder(builder: (context) {
                var items = TargetInvestasiController.instance
                    .getInvestmentForEachMonths();

                return ListView.builder(
                  itemCount: items.length, // Menggunakan bulan
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = items[index];
                    return Container(
                      padding: const EdgeInsets.all(6.0),
                      color: index % 2 == 0 ? Colors.white : Colors.white,
                      child: TargetDetailIndexedValueItem(
                        number: item["month"].toString(),
                        label: (item["deposit"] as double).number,
                        sublabel: (item["interest"] as double).number2,
                        value: (item["endingBalance"] as double).number,
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class TargetDetailValueItem extends StatelessWidget {
  final String label;
  final dynamic value;
  const TargetDetailValueItem({
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

class TargetDetailIndexedValueItem extends StatelessWidget {
  final dynamic number;
  final String label;
  final String sublabel;
  final dynamic value;

  const TargetDetailIndexedValueItem({
    super.key,
    required this.number,
    required this.label,
    required this.sublabel,
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
              "$sublabel",
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
