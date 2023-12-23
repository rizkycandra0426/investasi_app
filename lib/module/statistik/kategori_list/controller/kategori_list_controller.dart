import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/kategori_list_view.dart';

class KategoriListController extends State<KategoriListView> {
  static late KategoriListController instance;
  late KategoriListView view;

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
      "budget": 200000,
    },
    {
      "label": "Kopi",
      "budget": 150000,
    },
    {
      "label": "Snack",
      "budget": 0,
    },
    {
      "label": "Minuman",
      "budget": 0,
    }
  ];
}
