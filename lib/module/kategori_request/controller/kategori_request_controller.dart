import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/category_request_service.dart';
import '../view/kategori_request_view.dart';

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
      snackbarDanger(message: "$err");
    }
  }
}
