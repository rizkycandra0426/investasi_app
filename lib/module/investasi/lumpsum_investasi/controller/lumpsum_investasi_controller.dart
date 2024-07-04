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

    // Lakukan perhitungan investasi lumpsum dengan bunga majemuk secara iteratif
    double futureValue = principal;
    for (int i = 0; i < years; i++) {
      futureValue *= (1 + persentase / 100);
    }
    hasil = futureValue;
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
