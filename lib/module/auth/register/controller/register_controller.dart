import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hyper_ui/core.dart';
import '../view/register_view.dart';

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

  register() async {
    showLoading();
    bool isSuccess = await AuthService().register(
      name: name!,
      email: email!,
      password: password!,
    );
    hideLoading();

    if (!isSuccess) {
      snackbarDanger(message: "Daftar akun gagal");
      return;
    }

    Get.back();
    snackbarSuccess(message: "Berhasil mendaftarkan akun!");
  }
}
