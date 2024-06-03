import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hyper_ui/core.dart';
import '../view/notifikasi_view.dart';

class NotifikasiController extends State<NotifikasiView> {
  static late NotifikasiController instance;
  late NotifikasiView view;

  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";

  @override
  void initState() {
    instance = this;
    super.initState();
    loadData();
  }

  void updateTime(int newHour, int newMinute, String newTimeFormat) {
    setState(() {
      hour = newHour;
      minute = newMinute;
      timeFormat = newTimeFormat;
    });
  }

  Future<void> saveData(int hour, int minute, String timeFormat) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('hour', hour);
    await prefs.setInt('minute', minute);
    await prefs.setString('timeFormat', timeFormat);
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      hour = prefs.getInt('hour') ?? 0;
      minute = prefs.getInt('minute') ?? 0;
      timeFormat = prefs.getString('timeFormat') ?? 'AM';
    });
  }

  @override
  void dispose() {
    // Memanggil saveData saat keluar dari tampilan
    saveData(hour, minute, timeFormat);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
