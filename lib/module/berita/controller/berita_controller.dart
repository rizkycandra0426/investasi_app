import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/berita_service.dart';
import '../view/berita_view.dart';

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
    setState(() {});
  }

  berita() async {
    Get.offAll((BeritaView()));
  }

  request() async {
    Get.offAll((KategoriRequestView()));
  }

  logout() async {
    AuthService().logout();
    Get.offAll(LoginView());
  }
}
