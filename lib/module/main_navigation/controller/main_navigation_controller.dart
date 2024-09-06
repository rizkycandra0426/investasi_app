import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:permission_handler/permission_handler.dart';
import '../view/main_navigation_view.dart';

class MainNavigationController extends State<MainNavigationView> {
  static late MainNavigationController instance;
  late MainNavigationView view;

  Timer? timer;
  @override
  void initState() {
    instance = this;
    super.initState();

    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      TRX.saveRecord();
    });

    getPermission();
    OfflineService.cacheCategoriesFromApi();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  reload() {
    setState(() {});
  }

  getPermission() async {
    if (await Permission.notification.request().isGranted == false) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }
}
