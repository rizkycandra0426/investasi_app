import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/background.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Padding(
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
                if (kDebugMode)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.email = "admin@demo.com";
                          controller.password = "123456";
                          controller.login();
                        },
                        child: Text(
                          "Admin",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      InkWell(
                        onTap: () {
                          controller.email = "andra@demo.com";
                          controller.password = "123456";
                          controller.login();
                        },
                        child: Text(
                          "Andra",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
