import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                title: 'Name',
                hintText: 'Masukan nama lengkap.....',
                iconForm: "assets/icons/icon_email.png",
                onChanged: (value) {
                  controller.name = value;
                },
                value: controller.name,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Email',
                hintText: 'Masukan alamat email.....',
                iconForm: "assets/icons/icon_email.png",
                onChanged: (value) {
                  controller.email = value;
                },
                value: controller.email,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Password',
                hintText: 'Masukan password.....',
                obscureText: true,
                iconForm: "assets/icons/icon_password.png",
                onChanged: (value) {
                  controller.password = value;
                },
                value: controller.password,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: CustomButton(
                  title: 'Buat Akun Baru',
                  onPressed: () => controller.register(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah Punya Akun?',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      ' Login',
                      style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                        color: const Color(0xFF057798),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}
