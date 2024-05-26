import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/notifikasi_view.dart';

class NotifikasiController extends State<NotifikasiView> {
  static late NotifikasiController instance;
  late NotifikasiView view;

  var hour = 0;
  var minute = 0;
  var timeFormat = "";

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  void updateTime(int newHour, int newMinute, String newTimeFormat) {
    setState(() {
      hour = newHour;
      minute = newMinute;
      timeFormat = newTimeFormat;
    });
  }

  void saveData(int hour, int minute, String timeFormat) {}

  @override
  void dispose() {
    // Memanggil saveData saat keluar dari tampilan
    saveData(hour, minute, timeFormat);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
