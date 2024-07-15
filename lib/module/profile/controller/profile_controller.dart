import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/profile_view.dart';

class ProfileController extends State<ProfileView> {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  berita() async {
    Get.offAll((BeritaView()));
  }

  request() async {
    Get.offAll((KategoriRequestView()));
  }

  logout() async {
    var password = "";
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Masukkan password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                QTextField(
                  label: "Password",
                  obscure: true,
                  validator: Validator.required,
                  suffixIcon: Icons.password,
                  value: null,
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
    if (password.isEmpty) return;

    showLoading();

    try {
      await AuthService().checkLogin(
        email: currentUser!.email!,
        password: password,
      );

      hideLoading();
      Get.offAll(LoginView());
    } on Exception catch (err) {
      hideLoading();
      print(err);
      se("password salah!");
    }
  }

  refresh() {
    setState(() {});
  }
}
