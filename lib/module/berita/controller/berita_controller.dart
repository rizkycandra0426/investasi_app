import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

int? lastIdBerita;
bool adaBeritaBaru = false;

class BeritaController extends State<BeritaView> {
  static late BeritaController instance;
  late BeritaView view;

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
    var response = await BeritaService().get();
    items = response["data"];
    lastIdBerita = items.first["id_berita"];
    DBService.set("id_berita", lastIdBerita.toString());
    setState(() {});
  }

  berita() async {
    Get.offAll((BeritaView()));
  }

  request() async {
    Get.offAll((KategoriRequestView()));
  }

  logout() async {
    showLoading();
    try {
      AuthService().logout();
      Get.offAll(LoginView());
    } on Exception catch (err) {
      print(err);
    }
    hideLoading();
  }
}
