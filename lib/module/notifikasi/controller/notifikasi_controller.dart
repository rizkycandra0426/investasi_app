import 'package:flutter/material.dart';
import 'package:hyper_ui/service/notification_scheduler_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hyper_ui/core.dart';
import '../view/notifikasi_view.dart';

class NotifikasiController extends State<NotifikasiView> {
  static late NotifikasiController instance;
  late NotifikasiView view;

  var hour = 0;
  var minute = 0;

  @override
  void initState() {
    instance = this;
    super.initState();
    getData();
  }

  @override
  void dispose() {
    // Memanggil saveData saat keluar dari tampilan
    super.dispose();
  }

  var items = [];
  getData() async {
    var response = await NotificationSchedulerService().get();
    items = response["data"];

    if (items.isNotEmpty) {
      hour = items[0]["hour"];
      minute = items[0]["minute"];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  save() async {
    try {
      showLoading();
      await NotificationSchedulerService().create({
        "hour": hour,
        "minute": minute,
        "message":
            "Ingat Catat Keuanganmu Hari Ini, Pada Aplikasi Smart Finance !!",
      });
      hideLoading();
      ss("Berhasil mengupdate notifikasi!");
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
  }
}
