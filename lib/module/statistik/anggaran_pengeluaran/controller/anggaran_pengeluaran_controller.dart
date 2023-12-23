import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/anggaran_pengeluaran_view.dart';

class AnggaranPengeluaranController extends State<AnggaranPengeluaranView> {
  static late AnggaranPengeluaranController instance;
  late AnggaranPengeluaranView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List pengeluaranList = [
    {
      "label": "Makanan",
      "total": 150000,
      "budget": 200000,
    },
    {
      "label": "Kopi",
      "total": 123000,
      "budget": 150000,
    },
    {
      "label": "Snack",
      "total": 45000,
    },
    {
      "label": "Minuman",
      "total": 230000,
    }
  ];

  double get total {
    double _total = 0;
    for (var item in pengeluaranList) {
      if (item["budget"] == null) continue;
      _total += item["total"];
    }
    return _total;
  }

  double get totalBudget {
    double _total = 0;
    for (var item in pengeluaranList) {
      if (item["budget"] == null) continue;
      _total += item["budget"] ?? 0;
    }
    return _total;
  }

  double get sisa {
    return totalBudget - total;
  }
}
