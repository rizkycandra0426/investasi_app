// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class DetailInvestasi extends StatelessWidget {
  const DetailInvestasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = LumpsumInvestasiController.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Investasi (Lumpsum)"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DetailInvestasiValueItem(
                label: "Dana awal",
                value: "${controller.investasiAwal.currency}",
              ),
              DetailInvestasiValueItem(
                label: "Jangka Waktu",
                value: "${controller.jangkaWaktuDalamTahun} tahun",
              ),
              DetailInvestasiValueItem(
                label: "Persentase Bunga",
                value: "${controller.persentaseBunga}%",
              ),
              DetailInvestasiValueItem(
                label: "Total Dana",
                value: "${controller.investasiAwal.currency}",
              ),
              Builder(builder: (context) {
                var profit =
                    controller.investasiAwal * controller.persentaseBunga / 100;
                var amount = controller.investasiAwal;

                var nilaiInvestasi =
                    amount + (profit * (controller.jangkaWaktuDalamTahun));

                return DetailInvestasiValueItem(
                  label: "Nilai Investasi",
                  value:
                      "${(nilaiInvestasi - controller.investasiAwal).currency}",
                );
              }),
              Builder(builder: (context) {
                var profit =
                    controller.investasiAwal * controller.persentaseBunga / 100;
                var amount = controller.investasiAwal;

                var nilaiInvestasi =
                    amount + (profit * (controller.jangkaWaktuDalamTahun));

                return DetailInvestasiValueItem(
                  label: "Total nilai",
                  value: "${(nilaiInvestasi).currency}",
                );
              }),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.white,
                child: DetailInvestasiIndexedValueItem(
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
                  var profit = controller.investasiAwal *
                      controller.persentaseBunga /
                      100;
                  var amount = controller.investasiAwal;

                  var nilaiInvestasi = amount + (profit * (index + 1));

                  return Container(
                    padding: const EdgeInsets.all(6.0),
                    color: index % 2 == 0 ? Colors.white : Colors.white,
                    child: DetailInvestasiIndexedValueItem(
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

class DetailInvestasiValueItem extends StatelessWidget {
  final String label;
  final dynamic value;
  const DetailInvestasiValueItem({
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

class DetailInvestasiIndexedValueItem extends StatelessWidget {
  final dynamic number;
  final String label;
  final dynamic value;

  const DetailInvestasiIndexedValueItem({
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
