import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class RegisterController extends State<RegisterView> {
  static late RegisterController instance;
  late RegisterView view;

  @override
  void initState() {
    instance = this;
    if (kDebugMode) {
      // name = Faker.instance.name.fullName();
      // email = Faker.instance.internet.email().toLowerCase();
      // password = "123456";
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  register() async {
    if (passwordConfirmation != password) {
      showInfoDialog("Password confirmation must be the same as password");
      return;
    }

    showLoading();
    bool isSuccess = await AuthService().register(
      name: name!,
      email: email!,
      password: password!,
    );
    hideLoading();

    if (!isSuccess) {
      showInfoDialog("Daftar akun gagal");
      return;
    }
    Get.back();
    snackbarSuccess(message: "Berhasil mendaftarkan akun!");
  }
}
