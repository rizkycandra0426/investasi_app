import 'dart:async';
import 'dart:math' as math;

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

  double get currentMonthlyDeposit {
    double balance = 0; // Initial balance set to 0
    double percentage = persentaseBunga; // Annual interest rate
    int periodInYears = jangkaWaktuDalamTahun; // Duration in years
    double investasi = investasiAwal;
    // double depositPerMonth = 15468.69; // Monthly deposit amount
    //depositPerMonth based on investasi, percentage and periodInYears, don't use hasil variable!
    // double depositPerMonth = 15468.69;
    double depositPerMonth =
        getMonthlyDeposit(investasi, percentage, periodInYears);
    return depositPerMonth;
  }

  double getMonthlyDeposit(double targetAmount, double annualRate, int years) {
    // Convert annual interest rate to monthly and calculate total months
    double monthlyRate = (annualRate / 100) / 12;
    int totalMonths = years * 12;

    // Calculate the monthly deposit required
    double monthlyDeposit = (targetAmount * monthlyRate) /
        (math.pow(1 + monthlyRate, totalMonths) - 1);

    return monthlyDeposit;
  }

  List<Map<String, dynamic>> getInvestmentForEachMonths() {
    double balance = 0; // Initial balance set to 0
    double percentage = persentaseBunga; // Annual interest rate
    int periodInYears = jangkaWaktuDalamTahun; // Duration in years
    double investasi = investasiAwal;
    // double depositPerMonth = 15468.69; // Monthly deposit amount
    //depositPerMonth based on investasi, percentage and periodInYears, don't use hasil variable!
    // double depositPerMonth = 15468.69;
    double depositPerMonth =
        getMonthlyDeposit(investasi, percentage, periodInYears);

    print("depositPerMonth: ${depositPerMonth}");

    // List of items to be returned

    List<Map<String, dynamic>> items = [];

    // Monthly interest rate
    double monthlyRate = (percentage / 100) / 12;
    // Total months
    int totalMonths = periodInYears * 12;

    for (int month = 1; month <= totalMonths; month++) {
      double interest = 0;

      // Calculate interest for the previous month's balance, if not the first month
      if (month > 1) {
        interest = balance * monthlyRate;
      }

      // Add the monthly deposit to the balance
      balance += depositPerMonth;

      // Add interest to the balance
      balance += interest;

      // Add this month's data to the list
      items.add({
        "month": month,
        "deposit": depositPerMonth,
        "interest": interest,
        "endingBalance": balance,
      });
    }

    return items;
  }

  void hitungNilaiInvestasi() {
    double target = investasiAwal;
    double percentage = persentaseBunga;
    int periodInYears = jangkaWaktuDalamTahun;

    // Lakukan perhitungan investasi untuk mencapai target secara iteratif
    double monthlyInterestRate = percentage / 100 / 12;
    int months = periodInYears * 12;
    double totalMultiplier = 1.0;
    for (int i = 0; i < months; i++) {
      totalMultiplier *= (1 + monthlyInterestRate);
    }
    double monthlyContribution = target /
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
