import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  "assets/images/logo_new.png",
                  height: 270,
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Text(
                'REGISTER',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 15,
              ),
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
                height: 10,
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
                height: 10,
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
                height: 25,
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
