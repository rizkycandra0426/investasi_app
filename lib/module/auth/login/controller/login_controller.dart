import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/login_view.dart';

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
    showLoading();
    bool isSuccess = await AuthService().login(
      email: email!,
      password: password!,
    );
    hideLoading();

    await FirebaseNotificationService.getToken();

    if (!isSuccess) {
      snackbarDanger(message: "Gagal login!");
      return;
    }

    Get.offAll(MainNavigationView());
  }
}
