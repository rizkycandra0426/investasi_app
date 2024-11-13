import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class TransaksiKeuanganController extends State<TransaksiKeuanganView> {
  static late TransaksiKeuanganController instance;
  late TransaksiKeuanganView view;

  @override
  void initState() {
    instance = this;
    loadData();
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        if (textEditingController.text.isEmpty) {
          textEditingController.text = "0";
        }
        amount = double.parse(textEditingController.text.replaceAll(",", ""));
        print("amount: $amount");
        setState(() {});
      }
    });

    textEditingController.addListener(() {
      if (textEditingController.text.isEmpty) return;
      amount = double.parse(textEditingController.text.replaceAll(",", ""));
    });
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
      textEditingController.text = double.parse("${amount}").floor().toString();

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

  getSelectedCategories() {
    printr("isPemasukan: ${isPemasukan}");
    if (isPemasukan) {
      return kategoriPemasukanList;
    } else {
      return kategoriPengeluaranList;
    }
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
    print(getSelectedCategories());
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

  save() async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    amount = double.parse(textEditingController.text.replaceAll(",", ""));
    printg(textEditingController.text);
    printg(amount);

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

    var inputKategoriPemasukanList = OfflineService.get("kategori-pemasukan");
    var inputKategoriPengeluaranList =
        OfflineService.get("kategori-pengeluaran");

    if (isPemasukan) {
      Map category = inputKategoriPemasukanList.firstWhere(
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
      var userId = currentUser!.userId!;
      newId = (userId * 100000) + newId;

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
        "synced": false,
        "action": "create",
      });

      // await PemasukanService().create({
      //   "tanggal": date.yMd,
      //   "jumlah": amount,
      //   "catatan": memo,
      //   "id_kategori_pemasukan": idCategory,
      // });
    } else {
      Map category = inputKategoriPengeluaranList.firstWhere(
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
      var userId = currentUser!.userId!;
      newId = (userId * 100000) + newId;

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
        "synced": false,
        "action": "create",
      });

      // await PengeluaranService().create({
      //   "tanggal": date.yMd,
      //   "jumlah": amount,
      //   "catatan": memo,
      //   "id_kategori_pengeluaran": idCategory,
      // });
    }

    await OfflineService.syncPemasukanDanPengeluaranToServer();
    await OfflineService.reloadPemasukanAndPengeluaran();

    hideLoading();

    Navigator.pop(context);
  }

  update() async {
    var inputKategoriPemasukanList = OfflineService.get("kategori-pemasukan");
    var inputKategoriPengeluaranList =
        OfflineService.get("kategori-pengeluaran");
    showLoading();

    if (isPemasukan) {
      Map category = inputKategoriPemasukanList.firstWhere(
        (i) => i["id_kategori_pemasukan"] == idCategory,
        orElse: () => {},
      );

      var data = {
        "tanggal": widget.item!.tanggal!.yMd,
        "jumlah": double.parse(amount.toString()).floor(),
        "catatan": memo,
        "id_kategori_pemasukan": idCategory,
        "created_at": widget.item!.createdAt!,
        "updated_at": DateTime.now().toString(),
        "kategori_pemasukan": category,
        "nama_kategori": category["nama_kategori_pemasukan"],
        "nama_kategori_pemasukan": category["nama_kategori_pemasukan"],
        "synced": false,
        "action": "update",
      };

      printo(data.toString());

      OfflineService.update(
          "pemasukan", "id_pemasukan", widget.item!.id!, data);

      // await PemasukanService().update(widget.item!.id!, {
      //   "tanggal": date.yMd,
      //   "jumlah": amount,
      //   "catatan": memo,
      //   "id_kategori_pemasukan": idCategory,
      //   "_method": "PUT",
      // });
    } else {
      Map category = inputKategoriPengeluaranList.firstWhere(
        (i) => i["id_kategori_pengeluaran"] == idCategory,
        orElse: () => {},
      );

      printg(kategoriPengeluaranList);

      var data = {
        "tanggal": widget.item!.tanggal!.yMd,
        "jumlah": double.parse(amount.toString()).floor(),
        "catatan": memo,
        "id_kategori_pengeluaran": idCategory,
        "created_at": widget.item!.createdAt!,
        "updated_at": DateTime.now().toString(),
        "kategori_pengeluaran": category,
        "nama_kategori": category["nama_kategori_pengeluaran"],
        "nama_kategori_pengeluaran": category["nama_kategori_pengeluaran"],
        "synced": false,
        "action": "update",
      };

      printo(data.toString());

      OfflineService.update(
          "pengeluaran", "id_pengeluaran", widget.item!.id!, data);

      // await PengeluaranService().update(widget.item!.id!, {
      //   "tanggal": date.yMd,
      //   "jumlah": amount,
      //   "catatan": memo,
      //   "id_kategori_pengeluaran": idCategory,
      //   "_method": "PUT",
      // });
    }
    OfflineService.syncPemasukanDanPengeluaranToServer();

    hideLoading();
    printg("UPDATE SUCCESS?");
    Get.back();
    printg("UPDATE BACK SUCCESS?");
  }

  delete() async {
    showLoading();
    if (isPemasukan) {
      OfflineService.delete("pemasukan", "id_pemasukan", widget.item!.id!);
      // await PemasukanService().delete(widget.item!.id!);
    } else {
      OfflineService.delete("pengeluaran", "id_pengeluaran", widget.item!.id!);
      // await PengeluaranService().delete(widget.item!.id!);
    }
    OfflineService.syncPemasukanDanPengeluaranToServer();
    hideLoading();
    Get.back();
  }

  String categoryValue = "Pemasukan";
  reload() async {
    setState(() {});
  }

  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
}
