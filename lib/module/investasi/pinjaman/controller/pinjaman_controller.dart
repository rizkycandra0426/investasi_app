import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PinjamanController extends State<PinjamanView> {
  static late PinjamanController instance;
  late PinjamanView view;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool isPinjaman = true;
  bool isButtonPressed = false;
  bool isContainerVisible = true;

  String jenisPinjaman = "Bunga Menetap";

  void toggleContainerVisibility() {
    setState(() {
      isButtonPressed = !isButtonPressed; // Membalikkan status isButtonPressed
    });
    reset();
  }

  double pinjamanAwal = 0;
  int jangkaWaktuDalamBulan = 0;
  double persentaseBunga = 0;
  double hasil = 0;
  String hintText = "";

  void reset() {
    pinjamanAwal = 0;
    jangkaWaktuDalamBulan = 0;
    persentaseBunga = 0;
    hasil = 0;
    hintText = "";
    isButtonPressed = false;
    setState(() {});
    scrollController.jumpTo(0);
  }

  Future<bool> hitung() async {
    if (pinjamanAwal == 0 ||
        jangkaWaktuDalamBulan == 0 ||
        persentaseBunga == 0) {
      se("Mohon isi semua field");
      setState(() {});
      return false;
    }

    hitungNilaiPinjaman();
    setState(() {
      isButtonPressed = true;
    });

    await Future.delayed(Duration(milliseconds: 250));
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    print("Scroll to bottom");
    return true;
  }

  void hitungNilaiPinjaman() {
    double principal = pinjamanAwal;
    double persentase = persentaseBunga;
    int months = jangkaWaktuDalamBulan;

    double monthlyInterestRate = persentase / 100 / 12;

    double denominator = 1.0;
    for (int i = 0; i < months; i++) {
      denominator *= (1 + monthlyInterestRate);
    }
    double futureValue =
        (principal * monthlyInterestRate * denominator) / (denominator - 1);

    // Format nilai pembayaran bulanan dengan dua desimal
    futureValue = double.parse(futureValue.toStringAsFixed(2));

    hasil = futureValue;
  }

  TextEditingController pinjamanAwalController = TextEditingController(
    text: "0",
  );

  TextEditingController jangkaWaktuController = TextEditingController(
    text: "0",
  );

  TextEditingController persentaseBungaController = TextEditingController(
    text: "0",
  );

  reload() {
    setState(() {});
  }
}
