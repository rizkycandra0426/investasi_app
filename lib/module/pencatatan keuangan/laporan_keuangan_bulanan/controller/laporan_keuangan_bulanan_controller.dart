import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/laporan_keuangan_bulanan_view.dart';

class LaporanKeuanganBulananController
    extends State<LaporanKeuanganBulananView> {
  static late LaporanKeuanganBulananController instance;
  late LaporanKeuanganBulananView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  List items = [
    {
      "date": "2023-12-01 08:30:00",
      "account_name": "Kas",
      "description": "Makan sate",
      "pemasukan": 99000,
      "pengeluaran": 25000,
    },
    {
      "date": "2023-11-01 10:15:00",
      "account_name": "Bank",
      "description": "Pembelian buku",
      "pemasukan": 70000,
      "pengeluaran": 777000,
    },
    {
      "date": "2023-10-01 14:45:00",
      "account_name": "Kas",
      "description": "Belanja bahan makanan",
      "pemasukan": 23000,
      "pengeluaran": 2000,
    },
    {
      "date": "2023-09-01 09:20:00",
      "account_name": "Bank",
      "description": "Bayar tagihan listrik",
      "pemasukan": 100000,
      "pengeluaran": 5000,
    },
    {
      "date": "2023-08-01 12:30:00",
      "account_name": "Kas",
      "description": "Beli tiket bioskop",
      "pemasukan": 23000,
      "pengeluaran": 12000,
    },
    {
      "date": "2023-07-01 17:00:00",
      "account_name": "Kas",
      "description": "Makan di restoran",
      "pemasukan": 25000,
      "pengeluaran": 23000,
    },
    {
      "date": "2023-06-01 11:10:00",
      "account_name": "Bank",
      "description": "Pembayaran angsuran mobil",
      "pemasukan": 33000,
      "pengeluaran": 23000,
    },
    {
      "date": "2023-05-01 15:45:00",
      "account_name": "Kas",
      "description": "Makan di restoran",
      "pemasukan": 66000,
      "pengeluaran": 23000,
    },
  ];
}
