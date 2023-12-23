import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/laporan_keuangan_harian_view.dart';

class LaporanKeuanganHarianController extends State<LaporanKeuanganHarianView> {
  static late LaporanKeuanganHarianController instance;
  late LaporanKeuanganHarianView view;

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
      "date": "2023-11-01 08:30:00",
      "account_name": "Kas",
      "description": "Makan sate",
      "amount": 100000,
      "category": "Makanan",
    },
    {
      "date": "2023-11-02 10:15:00",
      "account_name": "Bank",
      "description": "Pembelian buku",
      "amount": 75000,
      "category": "Lainnya",
    },
    {
      "date": "2023-11-02 14:45:00",
      "account_name": "Kas",
      "description": "Belanja bahan makanan",
      "amount": 150000,
      "category": "Makanan",
    },
    {
      "date": "2023-11-03 09:20:00",
      "account_name": "Bank",
      "description": "Bayar tagihan listrik",
      "amount": 50000,
      "category": "Lainnya",
    },
    {
      "date": "2023-11-03 12:30:00",
      "account_name": "Kas",
      "description": "Beli tiket bioskop",
      "amount": 80000,
      "category": "Lainnya",
    },
    {
      "date": "2023-11-03 17:00:00",
      "account_name": "Kas",
      "description": "Makan di restoran",
      "amount": 120000,
      "category": "Makanan",
    },
    {
      "date": "2023-11-04 11:10:00",
      "account_name": "Bank",
      "description": "Pembayaran angsuran mobil",
      "amount": 200000,
      "category": "Lainnya",
    },
    {
      "date": "2023-11-04 15:45:00",
      "account_name": "Kas",
      "description": "Makan di restoran",
      "amount": 110000,
      "category": "Makanan",
    },
    {
      "date": "2023-11-04 19:20:00",
      "account_name": "Kas",
      "description": "Beli minuman",
      "amount": 25000,
      "category": "Minuman",
    },
    {
      "date": "2023-11-05 10:00:00",
      "account_name": "Bank",
      "description": "Pembelian pakaian",
      "amount": 90000,
      "category": "Lainnya",
    },
    {
      "date": "2023-11-05 13:30:00",
      "account_name": "Kas",
      "description": "Bayar parkir",
      "amount": 20000,
      "category": "Lainnya",
    },
    {
      "date": "2023-11-05 18:15:00",
      "account_name": "Kas",
      "description": "Beli makanan ringan",
      "amount": 30000,
      "category": "Makanan",
    },
    {
      "date": "2023-11-05 20:45:00",
      "account_name": "Kas",
      "description": "Beli minuman",
      "amount": 15000,
      "category": "Minuman",
    },
    {
      "date": "2023-11-06 09:40:00",
      "account_name": "Bank",
      "description": "Beli barang elektronik",
      "amount": 1200000,
      "category": "Lainnya",
    },
    {
      "date": "2023-11-06 12:15:00",
      "account_name": "Kas",
      "description": "Makan siang",
      "amount": 50000,
      "category": "Makanan",
    },
    {
      "date": "2023-11-07 10:30:00",
      "account_name": "Bank",
      "description": "Bayar cicilan rumah",
      "amount": 350000,
      "category": "Lainnya",
    },
    {
      "date": "2023-11-07 15:20:00",
      "account_name": "Kas",
      "description": "Belanja keperluan rumah",
      "amount": 90000,
      "category": "Lainnya",
    },
    {
      "date": "2023-12-01 14:00:00",
      "account_name": "Bank",
      "description": "Pembelian tiket pesawat",
      "amount": 250000,
      "category": "Lainnya",
    },
    {
      "date": "2023-12-02 19:10:00",
      "account_name": "Kas",
      "description": "Makan malam",
      "amount": 75000,
      "category": "Makanan",
    },
    {
      "date": "2023-12-03 11:50:00",
      "account_name": "Kas",
      "description": "Beli minuman",
      "amount": 20000,
      "category": "Minuman",
    },
  ];
}
