import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/stock_detail_response.dart';

class StockDetailController extends State<StockDetailView> {
  static late StockDetailController instance;
  late StockDetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getData();
    getChartData();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool loading = false;
  StockDetailResponse? data;
  getData() async {
    loading = true;
    setState(() {});
    data = await StockService().getDetail(
      widget.stock["nama_saham"],
    );
    setState(() {});

    loading = false;
    setState(() {});
  }

  List<Map<String, dynamic>> chartValues = [];
  int dateFilterIndex = 0;
  updateDateFilterIndex(int newIndex) {
    dateFilterIndex = newIndex;
    getChartData();
  }

  bool chartLoading = true;

  getChartData() async {
    chartLoading = true;
    setState(() {});

    List endpoints = [
      "histori_30hari",
      "histori_60hari",
      "histori_90hari",
      "histori_1tahun",
    ];
    var endpoint = endpoints[dateFilterIndex];
    var response = await dio.get(
      "$baseUrl/$endpoint/${widget.stock["nama_saham"]}",
    );
    print(response.data);
    var items = response.data["data"];
    chartValues.clear();
    for (var item in items) {
      chartValues.add({
        "date": DateTime.parse(item["date"]),
        "value": item["close"],
      });
    }

    print(chartValues);
    chartLoading = false;
    setState(() {});
  }
}
