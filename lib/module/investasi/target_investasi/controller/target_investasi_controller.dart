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
  void dispose() => super.dispose();

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
    investasiAwal = 0;
    jangkaWaktuDalamTahun = 0;
    jenisPersentaseBunga = "Sangat Konservatif";
    persentaseBunga = 0;
    hasil = 0;
    hintText = "";
    isButtonPressed = false;
    setState(() {});
    scrollController.jumpTo(0);
  }

  Map<String, List<int>> percentages = {
    "Sangat Konservatif": [6, 10],
    "Konservatif": [10, 20],
    "Moderat": [20, 30],
    "Agresif": [40, 60]
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

  void hitungNilaiInvestasi() {
    double principal = investasiAwal;
    double persentase = persentaseBunga;
    int years = jangkaWaktuDalamTahun;

    // Lakukan perhitungan investasi bulanandouble futureValue = 0;
    double monthlyInterestRate = persentase / 100 / 12;
    int months = years * 12;
    double totalMultiplier = 1.0;
    for (int i = 0; i < months; i++) {
      totalMultiplier *= (1 + monthlyInterestRate);
    }
    double futureValue = (principal * monthlyInterestRate * totalMultiplier) /
        (totalMultiplier - 1);

    hasil = futureValue;
  }
}
