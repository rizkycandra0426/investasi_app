import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
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
                height: 90,
              ),
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'LOGIN',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                title: 'Email',
                hintText: 'Masukan alamat email.....',
                iconForm: "assets/icons/icon_email.png",
                // textEditingController: emailController,
                onChanged: (value) {
                  controller.email = value;
                },
                value: controller.email,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Password',
                hintText: 'Masukan password.....',
                obscureText: true,
                iconForm: "assets/icons/icon_password.png",
                // textEditingController: passwordController,
                onChanged: (value) {
                  controller.password = value;
                },
                value: controller.password,
              ),
              const SizedBox(
                height: 41,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: CustomButton(
                  title: 'Login',
                  onPressed: () => controller.login(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tidak Punya Akun?',
                    style: greyTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: Text(
                      ' Buat Akun',
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
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
  State<LoginView> createState() => LoginController();
}
