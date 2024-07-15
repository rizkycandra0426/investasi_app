// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class BulananDetail extends StatelessWidget {
  const BulananDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = BulananInvestasiController.instance;

    var totalDana =
        controller.investasiAwal * 12 * controller.jangkaWaktuDalamTahun;
    double totalNilai = 0; // Dana akhir yang akan dikumpulkan
    double danaInvestasiAwal = controller.investasiAwal; // Dana bulanan
    double bungaPerBulan =
        controller.persentaseBunga / 100 / 12; // Bunga per bulan

    // Menghitung nilai investasi dari awal hingga bulan saat ini
    for (int i = 0; i <= ((controller.jangkaWaktuDalamTahun * 12) - 1); i++) {
      totalNilai = (totalNilai + danaInvestasiAwal) * (1 + bungaPerBulan);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Investasi (Bulanan)"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ValueItem(
                label: "Dana bulanan",
                value: "${controller.investasiAwal.currency}",
              ),
              ValueItem(
                label: "Jangka Waktu",
                value: "${controller.jangkaWaktuDalamTahun} tahun",
              ),
              ValueItem(
                label: "Persentase Bunga",
                value: "${controller.persentaseBunga}%",
              ),
              Builder(builder: (context) {
                return ValueItem(
                  label: "Total Dana",
                  value: "${totalDana.currency}",
                );
              }),
              Builder(builder: (context) {
                return ValueItem(
                  label: "Nilai Investasi",
                  value: "${(totalNilai - totalDana).currency}",
                );
              }),
              Builder(builder: (context) {
                return ValueItem(
                  label: "Total nilai",
                  value: "${(totalNilai).currency}",
                );
              }),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.grey[400],
                child: IndexedValueItem(
                  number: "Bulan",
                  label: "Investasi",
                  value: "Nilai Investasi",
                ),
              ),
              ListView.builder(
                itemCount: controller.jangkaWaktuDalamTahun * 12,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  double totalDanaAkhir = 0; // Dana akhir yang akan dikumpulkan
                  double danaInvestasiAwal =
                      controller.investasiAwal; // Dana bulanan
                  double bungaPerBulan =
                      controller.persentaseBunga / 100 / 12; // Bunga per bulan

                  // Menghitung nilai investasi dari awal hingga bulan saat ini
                  for (int i = 0; i <= index; i++) {
                    totalDanaAkhir = (totalDanaAkhir + danaInvestasiAwal) *
                        (1 + bungaPerBulan);
                  }

                  return Container(
                    padding: const EdgeInsets.all(6.0),
                    color: index % 2 == 0 ? Colors.grey[300] : Colors.grey[200],
                    child: IndexedValueItem(
                      number: index + 1,
                      label: "${danaInvestasiAwal.currency}",
                      value: "${totalDanaAkhir.currency}",
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
