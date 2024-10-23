import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class LupaPasswordController extends State<LupaPasswordView> {
  static late LupaPasswordController instance;
  late LupaPasswordView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String verificationCode = "";
  bool verificationCodeSent = false;

  verifyEmail() {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    verificationCodeSent = true;
    setState(() {});

    dio.post(
      "/auth/send-verification-code",
      data: {
        "email": email,
        "password": password,
        "verification_code": verificationCode,
      },
    );
  }

  resetPassword() async {
    if (verificationCode.isEmpty) {
      se("Invalid verification code!");
      return;
    }

    var correctVerificationCode =
        get6DigitCorrectVerificationCodeByInputtedEmail();
    printg("Correct verificationCode = $correctVerificationCode");

    try {
      showLoading();
      await dio.post(
        "/auth/reset-password",
        data: {
          "email": email,
          "password": password,
          "verification_code": verificationCode,
        },
      );
      hideLoading();
      ss("Reset password success!");
      Get.back();
    } on Exception {
      hideLoading();
      se("Invalid verification code!");
    }
  }

  get6DigitCorrectVerificationCodeByInputtedEmail() {
    var secretNumber = 318231;
    print("EMAIL : ${email} ${email.length}");
    return "${secretNumber * email.length}".substring(0, 6);
  }
}
