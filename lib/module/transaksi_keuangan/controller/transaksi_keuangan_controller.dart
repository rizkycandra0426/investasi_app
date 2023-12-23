import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/util/date_util/date_util.dart';
import '../view/transaksi_keuangan_view.dart';

class TransaksiKeuanganController extends State<TransaksiKeuanganView> {
  static late TransaksiKeuanganController instance;
  late TransaksiKeuanganView view;

  @override
  void initState() {
    instance = this;
    loadData();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List kategoriPemasukanList = [];
  List kategoriPengeluaranList = [];
  bool isPemasukan = true;
  bool isBottomSheetVisible = false;

  bool get isPengeluaran => isPemasukan == false;

  loadData() async {
    await getPemasukanCategories();
    await getPengeluaranCategories();
    setState(() {});
  }

  getPemasukanCategories() async {
    var response = await KategoriPemasukanService().get();

    List items = [];
    for (var item in response.data!) {
      items.add({
        "label": item.namaKategoriPemasukan,
        "value": item.idKategoriPemasukan,
      });
    }
    kategoriPemasukanList = items;
  }

  getPengeluaranCategories() async {
    var response = await KategoriPengeluaranService().get();
    List items = [];
    for (var item in response.data!) {
      items.add({
        "label": item.namaKategoriPengeluaran,
        "value": item.idKategoriPengeluaran,
      });
    }
    kategoriPengeluaranList = items;
  }

  showBottomSheet() {
    isBottomSheetVisible = true;
    setState(() {});
  }

  hideBottomSheet() {
    isBottomSheetVisible = false;
    setState(() {});
  }

  int idCategory = 0;
  String categoryName = "";
  DateTime date = DateTime.now();
  double amount = 0;
  String memo = "";
  setCategoryValue(int id, String _categoryName) {
    idCategory = id;
    categoryName = _categoryName;
    hideBottomSheet();
  }

  save() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid || idCategory <= 0 || categoryName.isEmpty || memo.isEmpty) {
      snackbarDanger(message: "Data tidak lengkap!");
      return;
    }

    showLoading();
    if (isPemasukan) {
      await PemasukanService().create({
        "user_id": 1,
        "tanggal": date.yMd,
        "jumlah": amount,
        "catatan": memo,
        "id_kategori_pemasukan": idCategory,
      });
    } else {
      await PengeluaranService().create({
        "user_id": 1,
        "tanggal": date.yMd,
        "jumlah": amount,
        "catatan": memo,
        "id_kategori_pengeluaran": idCategory,
      });
    }
    hideLoading();
    Get.offAll(MainNavigationView());
  }
}
