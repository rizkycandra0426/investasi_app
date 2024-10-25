// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class DetailAngsuran {
  int bulanKe;
  double bungaPerBulan;
  double angsuran;
  double totalAngsuran;
  double sisaPinjaman;

  DetailAngsuran({
    required this.bulanKe,
    required this.bungaPerBulan,
    required this.angsuran,
    required this.totalAngsuran,
    required this.sisaPinjaman,
  });
}

class PinjamanDetail extends StatelessWidget {
  const PinjamanDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = PinjamanController.instance;

    var pinjamanAwal = controller.pinjamanAwal;
    var jangkaWaktuDalamBulan = controller.jangkaWaktuDalamBulan;
    var persentaseBunga = controller.persentaseBunga;

    controller
        .hitungNilaiPinjaman(); // Memanggil fungsi hitungNilaiPinjaman dari controller

    List<DetailAngsuran> detailAngsuran = [];
    double bungaPerBulan =
        ((persentaseBunga / jangkaWaktuDalamBulan) * pinjamanAwal) / 100;

    for (int i = 0; i < jangkaWaktuDalamBulan; i++) {
      int bulan = i + 1;

      bool isBungaMenetap =
          PinjamanController.instance.jenisPinjaman == "Bunga Menetap";
      bool isBungaMenurun = !isBungaMenetap;

      double angsuranPerBulan = 0;
      double sisaPinjaman = 0;

      if (isBungaMenetap) {
        angsuranPerBulan = pinjamanAwal / jangkaWaktuDalamBulan;
        sisaPinjaman = pinjamanAwal - (angsuranPerBulan * bulan);
      } else if (isBungaMenurun) {
        angsuranPerBulan = pinjamanAwal / jangkaWaktuDalamBulan;
        sisaPinjaman = pinjamanAwal - (angsuranPerBulan * bulan);
      }

      double detailBungaPerbulan = bungaPerBulan;
      if (isBungaMenurun && i >= 1) {
        detailBungaPerbulan = (detailAngsuran[i - 1].sisaPinjaman *
                (persentaseBunga / jangkaWaktuDalamBulan)) /
            100;
        sisaPinjaman = detailAngsuran[i - 1].sisaPinjaman - angsuranPerBulan;
      }

      detailAngsuran.add(DetailAngsuran(
        bulanKe: bulan,
        bungaPerBulan: detailBungaPerbulan,
        angsuran: angsuranPerBulan,
        totalAngsuran: angsuranPerBulan + detailBungaPerbulan,
        sisaPinjaman: sisaPinjaman,
      ));
    }

    double totalAngsuran = detailAngsuran
        .map((e) => e.totalAngsuran)
        .reduce((value, element) => value + element);

    double totalBunga = totalAngsuran - controller.pinjamanAwal;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pinjaman"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DetailPinjamanValueItem(
                label: "Dana pinjaman",
                value: "${pinjamanAwal.currency}",
              ),
              DetailPinjamanValueItem(
                label: "Jangka Waktu",
                value: "${jangkaWaktuDalamBulan} bulan",
              ),
              DetailPinjamanValueItem(
                label: "Persentase Bunga",
                value: "${persentaseBunga.percentage}",
              ),
              Builder(builder: (context) {
                return DetailPinjamanValueItem(
                  label: "Total Bunga",
                  value: "${totalBunga.currency}",
                );
              }),
              Builder(builder: (context) {
                return DetailPinjamanValueItem(
                  label: "Total Angsuran /Bulan",
                  value: "${totalAngsuran.currency}",
                );
              }),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.white,
                child: PinjamanIndexedValueItem(
                  number: "Bulan",
                  bungaPerBulan: "Bunga",
                  angsuran: "Angsuran",
                  totalAngsuran: "Total\nAngsuran",
                  sisaPinjaman: "Sisa\nPinjaman",
                ),
              ),
              ListView.builder(
                itemCount: detailAngsuran
                    .length, // Jumlah bulan dalam periode jangka waktu
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = detailAngsuran[index];

                  return Container(
                    padding: const EdgeInsets.all(6.0),
                    color: index % 2 == 0 ? Colors.white : Colors.white,
                    child: PinjamanIndexedValueItem(
                      number: item.bulanKe,
                      bungaPerBulan: item.bungaPerBulan.number,
                      angsuran: "${item.angsuran.number}",
                      totalAngsuran: item.totalAngsuran.number,
                      sisaPinjaman: item.sisaPinjaman.number,
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

class DetailPinjamanValueItem extends StatelessWidget {
  final String label;
  final dynamic value;
  const DetailPinjamanValueItem({
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
