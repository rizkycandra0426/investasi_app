import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/target_investasi_view.dart';

class TargetInvestasiController extends State<TargetInvestasiView> {
  static late TargetInvestasiController instance;
  late TargetInvestasiView view;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool isTarget = true;
  bool isButtonPressed = false;
  bool isContainerVisible = true;

  void toggleContainerVisibility() {
    setState(() {
      isButtonPressed = !isButtonPressed; // Membalikkan status isButtonPressed
    });
    reset();
  }

  double investasiAwal = 0;
  int jangkaWaktuDalamTahun = 0;
  String jenisPersentaseBunga = "Sangat Konservatif";
  double persentaseBunga = 0;
  double hasil = 0;
  String hintText = "";

  reset() {
    investasiAwalController.text = "0";
    jangkaWaktuController.text = "0";
    persentaseBungaController.text = "0";

    investasiAwal = 0;
    jangkaWaktuDalamTahun = 0;
    jenisPersentaseBunga = "Sangat Konservatif";
    persentaseBunga = 0;
    hasil = 0;
    hintText = "";
    isButtonPressed = false;
    setState(() {});
    scrollController.jumpTo(0);
    setState(() {});
  }

  Map<String, List<int>> percentages = {
    "Sangat Konservatif": [0, 3],
    "Konservatif": [3, 5],
    "Moderat": [5, 8],
    "Agresif": [8, 12]
  };

  hitung() async {
    // await Future.delayed(Duration(milliseconds: 100));
    hitungNilaiInvestasi();
    setState(() {
      isButtonPressed = true;
    });

    await Future.delayed(Duration(milliseconds: 250));
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    print("Scroll to bottom");
  }

  String get percentageHint {
    var value = percentages[jenisPersentaseBunga];
    return "${value![0]}-${value[1]}%";
  }

  validateValue() {
    if (persentaseBunga > 3) {
      persentaseBunga = 3;
    }
    persentaseBunga = 100;
    setState(() {});
  }

  void hitungNilaiInvestasi() {
    double targetValue = investasiAwal;
    double persentase = persentaseBunga;
    int years = jangkaWaktuDalamTahun;

    // Lakukan perhitungan investasi untuk mencapai target secara iteratif
    double monthlyInterestRate = persentase / 100 / 12;
    int months = years * 12;
    double totalMultiplier = 1.0;
    for (int i = 0; i < months; i++) {
      totalMultiplier *= (1 + monthlyInterestRate);
    }
    double monthlyContribution = targetValue /
        ((((totalMultiplier - 1) / monthlyInterestRate)) *
            (1 + monthlyInterestRate));

    hasil = monthlyContribution;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int get minPercentage => percentages[jenisPersentaseBunga]![0];
  int get maxPercentage => percentages[jenisPersentaseBunga]![1];

  TextEditingController investasiAwalController = TextEditingController(
    text: "0",
  );

  TextEditingController jangkaWaktuController = TextEditingController(
    text: "0",
  );

  TextEditingController persentaseBungaController = TextEditingController(
    text: "0",
  );
}
