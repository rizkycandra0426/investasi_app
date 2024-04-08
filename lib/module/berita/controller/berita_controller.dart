import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/berita_view.dart';

class BeritaController extends State<BeritaView> {
  static late BeritaController instance;
  late BeritaView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
