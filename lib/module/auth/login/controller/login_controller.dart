import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    refreshUserDataViewer();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? email = kDebugMode ? "admin@demo.com" : null;
  String? password = kDebugMode ? "123456" : null;

  login() async {
    try {
      showLoading();
      bool isSuccess = await AuthService().login(
        email: email!,
        password: password!,
      );
      hideLoading();

      if (!isSuccess) {
        snackbarDanger(
            message: "Password salah atau akun belum terverifikasi!");
        return;
      }

      showLoading();
      await OfflineService.loadLocalValues();
      hideLoading();

      Get.offAll(MainNavigationView());
    } on Exception catch (err) {
      printr(err);
      snackbarDanger(message: "Password salah atau akun belum terverifikasi!");
    }
  }
}
