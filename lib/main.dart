import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:hyper_ui/service/offline_service.dart';
import 'package:hyper_ui/service/stock_new_service.dart';
import 'package:hyper_ui/state_util.dart';
import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/service/db_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

// fund_alloc
// value_effect
// NaN

bool isDeveloper = false;
List<String> superDevs = [
  "TP1A.220624.014",
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.init();
  // await DBService.clear("token");
  // await DBService.deleteAll();
  Diointerceptors.init();

  if (Platform.isAndroid) {
    print("1. Firebase");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("2. Init  notifications");
    await FirebaseNotificationService.initNotifications();

    print("3. getToken");
    await FirebaseNotificationService.getToken();
  }

  // TRX.generateDummies();

  print("4. initStock");
  TRX.initStock();

  print("5. load current user data");
  await AuthService().loadCurrentUserData();

  print("6. load record");
  await TRX.loadRecord();

  print("7. stock new servie init");
  await StockNewService.initialize();

  if (token != null) {
    print("8. load local values");
    await OfflineService.loadLocalValues();
  }

  // if (Platform.isAndroid) {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //   if (superDevs.contains(androidInfo.id)) {
  //     isDeveloper = true;
  //   }
  // } else if (Platform.isWindows) {
  //   isDeveloper = true;
  // }

  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme().copyWith(
        //set card elevation?
        cardTheme: CardTheme(
          elevation: 1.4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      // home: Platform.isWindows ? SahamView() : SplashScreenView(),
      // home: SahamView(),
      // home: Platform.isWindows ? SahamView() : SplashScreenView(),
      home: SplashScreenView(),
      // builder: (context, child) => DebugView(
      //   context: context,
      //   child: child,
      //   visible: true,
      // ),
    );
  }
}
