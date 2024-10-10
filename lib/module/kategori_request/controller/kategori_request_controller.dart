import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class KategoriRequestController extends State<KategoriRequestView> {
  static late KategoriRequestController instance;
  late KategoriRequestView view;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    getData();
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? namaKategori;
  String? categoryType;

  bool loading = false;
  List items = [];
  getData() async {
    Map<String, dynamic> response = await CategoryRequestService().get();
    print(response);
    items = response["data"];
    setState(() {});
  }

  submit() async {
    var index = items.indexWhere((i) => i["nama_kategori"] == namaKategori);
    if (index > -1) {
      se("Kategori sudah ada!");
      return;
    }

    try {
      showLoading();
      await CategoryRequestService().create({
        "nama_kategori": namaKategori,
        "category_type": categoryType,
      });
      hideLoading();
      snackbarSuccess(message: "Berhasil menyimpan data!");
      getData();
    } on Exception catch (err) {
      hideLoading();
      se("$err");
    }
  }
}
