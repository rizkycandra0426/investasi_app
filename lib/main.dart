import 'package:firebase_core/firebase_core.dart';
import 'package:hyper_ui/service/offline_service.dart';
import 'package:hyper_ui/service/stock_new_service.dart';
import 'package:hyper_ui/state_util.dart';
import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/service/db_service.dart';
import 'package:permission_handler/permission_handler.dart';

// fund_alloc
// value_effect
// NaN
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotificationService.initNotifications();
  await DBService.init();
  // await DBService.clear("token");
  Diointerceptors.init();

  await AuthService().loadCurrentUserData();

  await OfflineService.loadLocalValues();
  await StockNewService.initialize();

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
      theme: getDefaultTheme(),
      home: SplashScreenView(),
      builder: (context, child) => DebugView(
        context: context,
        child: child,
        visible: true,
      ),
    );
  }
}
