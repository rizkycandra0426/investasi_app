import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/statistik_dashboard_view.dart';

class StatistikDashboardController extends State<StatistikDashboardView> {
  static late StatistikDashboardController instance;
  late StatistikDashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int counter = 0;
  next() {
    counter++;
    setState(() {});
  }

  prev() {
    counter--;
    setState(() {});
  }

  int selectedIndex = 0;
  updateSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
  }

  DateTime get currentDate {
    DateTime now = DateTime.now();
    return DateTime(now.year, (now.month + counter));
  }
}
