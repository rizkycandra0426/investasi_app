import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/lupa-password_controller.dart';

class LupaPasswordView extends StatefulWidget {
  const LupaPasswordView({Key? key}) : super(key: key);
  Widget build(context, LupaPasswordController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lupa Password"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              QTextField(
                key: Key("email_${controller.verificationCodeSent}"),
                label: "Email",
                validator: Validator.email,
                suffixIcon: Icons.email,
                value: controller.email,
                enabled: controller.verificationCodeSent ? false : true,
                onChanged: (value) {
                  controller.email = value;
                },
              ),
              if (controller.verificationCodeSent) ...[
                QNumberField(
                  label: "Verification Code",
                  // validator: Validator.required,
                  value: controller.verificationCode,
                  onChanged: (value) {
                    controller.verificationCode = value;
                  },
                ),
                QTextField(
                  label: "New Password",
                  obscure: true,
                  validator: Validator.required,
                  suffixIcon: Icons.password,
                  value: controller.password,
                  onChanged: (value) {
                    controller.password = value;
                  },
                ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: controller.verificationCodeSent
          ? QActionButton(
              label: "Reset password",
              onPressed: () => controller.resetPassword(),
            )
          : QActionButton(
              label: "Verify email",
              onPressed: () => controller.verifyEmail(),
            ),
    );
  }

  @override
  State<LupaPasswordView> createState() => LupaPasswordController();
}
