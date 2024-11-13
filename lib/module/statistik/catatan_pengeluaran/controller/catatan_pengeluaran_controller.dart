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
  DateTime tanggal = DateTime.now();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  create() {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }
    if (title.isEmpty) {
      showInfoDialog("Deskripsi tidak boleh kosong");
      return;
    }
    if (note == 0) {
      showInfoDialog("Jumlah tidak boleh kosong");
      return;
    }

    items.add({
      "id": Uuid().v4(),
      "year": StatistikDashboardController.instance.currentDate.year,
      "month": StatistikDashboardController.instance.currentDate.month,
      "title": title,
      "tanggal": tanggal.yMd,
      "note": note,
    });

    ss("Berhasil menyimpan catatan!");
    DBService.saveList("catatan", items);
    setState(() {});

    Navigator.pop(context);
  }

  update(String id) {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    var index = items.indexWhere((element) => element["id"] == id);
    if (index == -1) {
      return;
    }

    items[index]["title"] = title;
    items[index]["note"] = note;
    items[index]["tanggal"] = tanggal.yMd;

    ss("Berhasil mengubah catatan!");
    DBService.saveList("catatan", items);
    setState(() {});

    Navigator.pop(context);
  }

  delete(Map item) {
    items.remove(item);
    ss("Berhasil menghapus catatan!");
    DBService.saveList("catatan", items);
    setState(() {});
  }

  String search = "";
  searchItem(String value) {
    search = value;
    setState(() {});
  }
}
