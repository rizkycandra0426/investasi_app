import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/lumpsum_investasi_view.dart';

class LumpsumInvestasiController extends State<LumpsumInvestasiView> {
  static late LumpsumInvestasiController instance;
  late LumpsumInvestasiView view;

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

  bool isLumpsum = true;
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

    await Future.delayed(Duration(milliseconds: 450));
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

    // Lakukan perhitungan investasi bulanan
    double futureValue = principal * (1 + persentase / 100) * (years);
    hasil = futureValue;
  }
}
