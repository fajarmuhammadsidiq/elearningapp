import 'package:elearning_app/bindings/initial_bindings.dart';
import 'package:elearning_app/configs/themes/app_light.dart';
import 'package:elearning_app/controllers/question_paper/theme_controller.dart';
import 'package:elearning_app/screens/splashScreens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'configs/themes/app_dark.dart';
import 'firebase_options.dart';
import 'data_uploader_screen.dart';
import 'routes/app_route.dart';
import 'screens/introduction/introduction.dart';

// Future<void> main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: Get.find<ThemeController>().lightTheme,
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.route());
  }
}
