import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
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
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
