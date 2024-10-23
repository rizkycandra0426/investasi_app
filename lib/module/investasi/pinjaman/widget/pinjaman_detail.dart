// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

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
    var angsuranPerBulan = controller.hasil;

    var totalBunga = (angsuranPerBulan * jangkaWaktuDalamBulan) - pinjamanAwal;

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
                  value: "${angsuranPerBulan.currency}",
                );
              }),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.white,
                child: PinjamanIndexedValueItem(
                  number: "Bulan",
                  angsuran: "Angsuran",
                  totalAngsuran: "Total Angsuran",
                  sisaPinjaman: "Sisa Pinjaman",
                ),
              ),
              ListView.builder(
                itemCount: controller
                    .jangkaWaktuDalamBulan, // Jumlah bulan dalam periode jangka waktu
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  double danaInvestasiAwal = controller.hasil; // Dana bulanan

                  bool isBungaMenetap =
                      PinjamanController.instance.jenisPinjaman ==
                          "Bunga Menetap";
                  bool isBungaMenurun = !isBungaMenetap;

                  double totalAngsuran = 0;
                  double sisaPinjaman = 0;

                  if (isBungaMenetap) {
                    totalAngsuran = danaInvestasiAwal * (index + 1);
                    sisaPinjaman = controller.pinjamanAwal - totalAngsuran;
                  } else if (isBungaMenurun) {
                    /*
                    Contoh kode di JAVASCRIPT
                    function calculateNilai() {
        const pinjamandana = parseFloat(document.getElementById('pinjamandana').value);
        const jmhtahun = parseFloat(document.getElementById('jmhtahun').value);
        const persentasebunga = parseFloat(document.getElementById('persentasebunga').value);

        if (!isNaN(pinjamandana) && !isNaN(jmhtahun) && !isNaN(persentasebunga)) {
            const tingkatBungaPerBulan = persentasebunga / 100 / 12; // Tingkat bunga per bulan
            let remainingLoan = pinjamandana;
            const monthlyPayments = [];
            let totalPayment = 0;

            for (let i = 1; i <= jmhtahun; i++) {
                const interestPayment = remainingLoan * tingkatBungaPerBulan;
                const principalPayment = (pinjamandana / jmhtahun);
                const monthlyPayment = interestPayment + principalPayment;
                remainingLoan -= principalPayment;
                totalPayment += monthlyPayment;

                monthlyPayments.push({
                    'month': i,
                    'monthly_payment': monthlyPayment,
                    'interest_payment': interestPayment,
                    'principal_payment': principalPayment,
                    'remaining_loan': remainingLoan,
                });
            }
            return {
                'monthly_payments': monthlyPayments,
                'total_payment': totalPayment,
            };
        } else {
            return 'Invalid input';
        }
    }
                    */
                    // Jika bunga menurunt, total angsuran di bulan pertama lebih besar dari bunga menetap, tapi setiap bulannya akan terus menurun tergantung bunga-nya?
                    double bungaPerBulan =
                        controller.persentaseBunga / 100 / 12;
                    double remainingLoan = controller.pinjamanAwal;
                    double totalPayment = 0;

                    for (int i = 1; i <= index + 1; i++) {
                      double interestPayment = remainingLoan * bungaPerBulan;
                      double principalPayment =
                          controller.pinjamanAwal / jangkaWaktuDalamBulan;
                      double monthlyPayment =
                          interestPayment + principalPayment;
                      remainingLoan -= principalPayment;
                      totalPayment += monthlyPayment;
                    }

                    totalAngsuran = totalPayment;
                    sisaPinjaman = remainingLoan;
                    angsuranPerBulan = totalAngsuran / (index + 1);

                    // Format nilai pembayaran bulanan dengan dua desimal
                    totalAngsuran =
                        double.parse(totalAngsuran.toStringAsFixed(2));
                    sisaPinjaman =
                        double.parse(sisaPinjaman.toStringAsFixed(2));
                  }

                  // Pastikan sisaPinjaman tidak menampilkan nilai negatif
                  sisaPinjaman = max(sisaPinjaman, 0);

                  // Menggunakan NumberFormat untuk format mata uang
                  final formatCurrency =
                      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

                  return Container(
                    padding: const EdgeInsets.all(6.0),
                    color: index % 2 == 0 ? Colors.white : Colors.white,
                    child: PinjamanIndexedValueItem(
                      number: index + 1,
                      angsuran: angsuranPerBulan.currency,
                      totalAngsuran: formatCurrency.format(totalAngsuran),
                      sisaPinjaman: formatCurrency.format(sisaPinjaman),
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
