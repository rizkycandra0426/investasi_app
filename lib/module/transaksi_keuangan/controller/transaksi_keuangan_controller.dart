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

  bool get isEditMode => widget.item != null;

  bool loading = true;

  loadData() async {
    loading = true;
    setState(() {});
    await getPemasukanCategories();
    await getPengeluaranCategories();

    if (isEditMode) {
      categoryName = widget.item!.namaKategori!;
      idCategory = widget.item!.idKategori!;
      amount = double.parse(widget.item!.jumlah!.toString());
      memo = widget.item!.catatan!;

      if (widget.item!.type == "Pengeluaran") {
        isPemasukan = false;
      }
    }
    loading = false;
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

  save([bool navigate = true]) async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid || idCategory <= 0 || categoryName.isEmpty || memo.isEmpty) {
      snackbarDanger(message: "Data tidak lengkap!");
      return;
    }

    showLoading();
    if (isPemasukan) {
      await PemasukanService().create({
        "tanggal": date.yMd,
        "jumlah": amount,
        "catatan": memo,
        "id_kategori_pemasukan": idCategory,
      });
    } else {
      await PengeluaranService().create({
        "tanggal": date.yMd,
        "jumlah": amount,
        "catatan": memo,
        "id_kategori_pengeluaran": idCategory,
      });
    }
    hideLoading();
    if (navigate == true) {
      Get.offAll(MainNavigationView());
    }
  }

  update() async {
    showLoading();
    if (isPemasukan) {
      await PemasukanService().update(widget.item!.id!, {
        "tanggal": date.yMd,
        "jumlah": amount,
        "catatan": memo,
        "id_kategori_pemasukan": idCategory,
        "_method": "PUT",
      });
    } else {
      await PengeluaranService().update(widget.item!.id!, {
        "tanggal": date.yMd,
        "jumlah": amount,
        "catatan": memo,
        "id_kategori_pengeluaran": idCategory,
        "_method": "PUT",
      });
    }
    hideLoading();
    Get.offAll(MainNavigationView());
  }

  delete() async {
    showLoading();
    if (isPemasukan) {
      await PemasukanService().delete(widget.item!.id!);
    } else {
      await PengeluaranService().delete(widget.item!.id!);
    }
    hideLoading();
    Get.offAll(MainNavigationView());
  }
}
