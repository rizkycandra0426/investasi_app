import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:lottie/lottie.dart';
import '../controller/splash_screen_controller.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  Widget build(context, SplashScreenController controller) {
    controller.view = this;
    bool isLoggedIn = token.isNotEmpty;
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                "assets/animations/logo_animasi.json",
              ),
            ),
          ],
        ),
      ),
      nextScreen: isLoggedIn ? MainNavigationView() : LoginView(),
      duration: kDebugMode ? 0 : 3500,
      splashIconSize: 250, // Ubah sesuai kebutuhan
      backgroundColor: Colors.white,
    );
  }

  @override
  State<SplashScreenView> createState() => SplashScreenController();
}

// Column(
//   children: [
//     Center(
//       child: Lottie.asset(
//         "assets/animations/logo_animasi.json",
//       ),
//     ),
//   ],
// ),
