// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PinjamanDetail extends StatelessWidget {
  const PinjamanDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = PinjamanController.instance;

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
              ValueItem(
                label: "Dana pinjaman",
                value: "${controller.pinjamanAwal.currency}",
              ),
              ValueItem(
                label: "Jangka Waktu",
                value: "${controller.jangkaWaktuDalamBulan} bulan",
              ),
              ValueItem(
                label: "Persentase Bunga",
                value: "${controller.persentaseBunga.percentage}",
              ),
              Builder(builder: (context) {
                controller
                    .hitungNilaiPinjaman(); // Memanggil fungsi hitungNilaiPinjaman dari controller

                var totalBunga = 0.0;
                var totalAngsuran = controller
                    .hasil; // Total angsuran yang dibayarkan selama periode

                double pinjamanAwal = controller.pinjamanAwal;
                double persentaseBunga = controller.persentaseBunga / 100;
                int jangkaWaktuDalamBulan = controller.jangkaWaktuDalamBulan;

                for (int i = 0; i < jangkaWaktuDalamBulan; i++) {
                  // Hitung bunga bulanan
                  double bungaBulanan = pinjamanAwal * persentaseBunga / 12;

                  // Akumulasikan total bunga
                  totalBunga += bungaBulanan;

                  // Kurangi pinjaman dengan angsuran bulanan
                  pinjamanAwal -= totalAngsuran;
                }

                return ValueItem(
                  label: "Total Bunga",
                  value: "${totalBunga.currency}",
                );
              }),
              Builder(builder: (context) {
                controller
                    .hitungNilaiPinjaman(); // Memanggil fungsi hitungNilaiPinjaman dari controller

                var totalAngsuran = controller.hasil;

                return ValueItem(
                  label: "Total Angsuran /Bulan",
                  value: "${totalAngsuran.currency}",
                );
              }),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.grey[400],
                child: IndexedValueItem(
                  number: "Bulan",
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
                    child: IndexedValueItem(
                      number: index + 1,
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
