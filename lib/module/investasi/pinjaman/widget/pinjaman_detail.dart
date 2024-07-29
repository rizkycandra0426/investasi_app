// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

import 'pinjaman_indexed_value_item.dart';

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
    var totalAngsuranPerBulan = controller.hasil;

    var totalBunga =
        (totalAngsuranPerBulan * jangkaWaktuDalamBulan) - pinjamanAwal;

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
                  value: "${totalAngsuranPerBulan.currency}",
                );
              }),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.grey[400],
                child: PinjamanIndexedValueItem(
                  number: "Bulan",
                  col1: "Angsuran",
                  label: "Total Angsuran",
                  value: "Sisa Pinjaman",
                ),
              ),
              ListView.builder(
                itemCount: controller
                    .jangkaWaktuDalamBulan, // Jumlah bulan dalam periode jangka waktu
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  double danaInvestasiAwal = controller.hasil; // Dana bulanan
                  double bungaPerBulan =
                      controller.persentaseBunga / 100 / 12; // Bunga per bulan

                  // Menghitung total angsuran yang telah dibayarkan hingga bulan ini
                  double totalAngsuran = danaInvestasiAwal * (index + 1);

                  // Menghitung sisa pinjaman setelah angsuran bulan ini
                  double sisaPinjaman = controller.pinjamanAwal - totalAngsuran;

                  // Pastikan sisaPinjaman tidak menampilkan nilai negatif
                  sisaPinjaman = max(sisaPinjaman, 0);

                  // Menggunakan NumberFormat untuk format mata uang
                  final formatCurrency =
                      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

                  return Container(
                    padding: const EdgeInsets.all(6.0),
                    color: index % 2 == 0 ? Colors.grey[300] : Colors.grey[200],
                    child: PinjamanIndexedValueItem(
                      number: index + 1,
                      col1: totalAngsuranPerBulan.currency,
                      label: formatCurrency.format(totalAngsuran),
                      value: formatCurrency.format(sisaPinjaman),
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
