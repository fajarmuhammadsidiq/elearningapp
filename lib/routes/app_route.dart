import 'package:elearning_app/screens/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/introduction/introduction.dart';

class AppRoutes {
  static List<GetPage> route() => [
        GetPage(
          name: "/",
          page: () => SplashScren(),
        ),
        GetPage(
          name: "/introduction",
          page: () => IntroductionScreen(),
        )
      ];
}
