import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/transaksi_keuangan/widget/category_selector.dart';
import 'package:hyper_ui/service/offline_service.dart';
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
    var values = await OfflineService.get("kategori-pemasukan");

    List items = [];
    for (var item in values) {
      items.add({
        "label": item["nama_kategori_pemasukan"],
        "value": item["id_kategori_pemasukan"],
      });
    }
    kategoriPemasukanList = items;
  }

  getPengeluaranCategories() async {
    var values = await OfflineService.get("kategori-pengeluaran");
    List items = [];
    for (var item in values) {
      items.add({
        "label": item["nama_kategori_pengeluaran"],
        "value": item["id_kategori_pengeluaran"],
      });
    }
    kategoriPengeluaranList = items;
  }

  showBottomSheet() async {
    await Get.to(CategorySelectorView());
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

    if (amount <= 0) {
      snackbarDanger(message: "Jumlah tidak boleh 0!");
      return;
    }

    showLoading();

    var kategoriPemasukanList = OfflineService.get("kategori-pemasukan");
    var kategoriPengeluaranList = OfflineService.get("kategori-pengeluaran");

    if (isPemasukan) {
      Map<String, dynamic> category = kategoriPemasukanList.firstWhere(
        (i) => i["id_kategori_pemasukan"] == idCategory,
        orElse: () => {},
      );

      var pemasukan = OfflineService.get("pemasukan");
      var highestId = 0;
      for (var item in pemasukan) {
        if (item["id_pemasukan"] > highestId) {
          highestId = item["id_pemasukan"];
        }
      }
      var newId = highestId + 1;

      OfflineService.add("pemasukan", {
        "id_pemasukan": newId,
        "user_id": currentUser?.userId,
        "tanggal": date.yMd,
        "jumlah": double.parse(amount.toString()).floor(),
        "catatan": memo,
        "id_kategori_pemasukan": idCategory,
        "created_at": DateTime.now().toString(),
        "updated_at": DateTime.now().toString(),
        "kategori_pemasukan": category,
        "nama_kategori": category["nama_kategori_pemasukan"],
        "nama_kategori_pemasukan": category["nama_kategori_pemasukan"],
        "sync": false,
      });

      // await PemasukanService().create({
      //   "tanggal": date.yMd,
      //   "jumlah": amount,
      //   "catatan": memo,
      //   "id_kategori_pemasukan": idCategory,
      // });
    } else {
      Map<String, dynamic> category = kategoriPengeluaranList.firstWhere(
        (i) => i["id_kategori_pengeluaran"] == idCategory,
        orElse: () => {},
      );

      var pengeluaran = OfflineService.get("pengeluaran");
      var highestId = 0;
      for (var item in pengeluaran) {
        if (item["id_pengeluaran"] > highestId) {
          highestId = item["id_pengeluaran"];
        }
      }
      var newId = highestId + 1;

      OfflineService.add("pengeluaran", {
        "id_pengeluaran": newId,
        "user_id": currentUser?.userId,
        "tanggal": date.yMd,
        "jumlah": double.parse(amount.toString()).floor(),
        "catatan": memo,
        "id_kategori_pengeluaran": idCategory,
        "created_at": DateTime.now().toString(),
        "updated_at": DateTime.now().toString(),
        "kategori_pengeluaran": category,
        "nama_kategori": category["nama_kategori_pengeluaran"],
        "nama_kategori_pengeluaran": category["nama_kategori_pengeluaran"],
        "sync": false,
      });

      // await PengeluaranService().create({
      //   "tanggal": date.yMd,
      //   "jumlah": amount,
      //   "catatan": memo,
      //   "id_kategori_pengeluaran": idCategory,
      // });
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

  TextEditingController textEditingController = TextEditingController();
}
