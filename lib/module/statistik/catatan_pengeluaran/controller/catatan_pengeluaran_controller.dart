import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class CatatanPengeluaranController extends State<CatatanPengeluaranView> {
  static late CatatanPengeluaranController instance;
  late CatatanPengeluaranView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getData();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List items = [];
  getData() async {
    items = await DBService.loadList("catatan");
    setState(() {});
  }

  String title = "";
  String note = "";

  create() {
    if (title.isEmpty) {
      showInfoDialog("Deskripsi tidak boleh kosong");
      return;
    }
    if (note == 0) {
      showInfoDialog("Jumlah tidak boleh kosong");
      return;
    }

    items.add({
      "year": StatistikDashboardController.instance.currentDate.year,
      "month": StatistikDashboardController.instance.currentDate.month,
      "title": title,
      "note": note,
    });
    Navigator.pop(context);

    ss("Berhasil menyimpan catatan!");
    DBService.saveList("catatan", items);
    setState(() {});
  }

  delete(Map item) {
    items.remove(item);
    ss("Berhasil menghapus catatan!");
    DBService.saveList("catatan", items);
    setState(() {});
  }
}
