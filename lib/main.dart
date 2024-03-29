import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/service/db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.init();
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
      home: LoginView(),
      builder: (context, child) => DebugView(
        context: context,
        child: child,
        visible: true,
      ),
    );
  }
}
