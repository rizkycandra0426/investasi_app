import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/histori_dana_view.dart';

class HistoriDanaController extends State<HistoriDanaView> {
  static late HistoriDanaController instance;
  late HistoriDanaView view;

  List items = [];
  double total = 0;
  Map porto = {};

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    getData();
  }

  double hargaUnit = 0;
  List hargaUnits = [];

  double getHargaUnit(String month) {
    for (var element in hargaUnits) {
      var mmm = DateFormat("MMMM").format(DateTime.parse(element["date"]));
      print("$mmm == $month");
      if (DateFormat("MMMM")
              .format(DateTime.parse(element["date"]))
              .toString() ==
          month.toString()) {
        return element["harga_unit"] * 1.0;
      }
    }

    return 0;
  }

  getData() async {
    var responseHargaUnit = await Dio().get(
      "$baseUrl/v2/harga-unit",
    );
    hargaUnits = responseHargaUnit.data;

    //---------------
    //---------------

    var response2 = await PortoService().get(param: {
      "year": 2024,
    });
    porto = response2["porto"];
    hargaUnit = porto["harga_unit"];
    //---------------------------
    //---------------------------

    items = await SaldoService().getSaldoMasukHistory();
    total = 0;
    for (var item in items) {
      total += double.tryParse(item["saldo"].toString()) ?? 0.0;
    }
    setState(() {});
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
