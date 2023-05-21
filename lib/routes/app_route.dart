import 'package:elearning_app/controllers/zoom_drawer_controller.dart';
import 'package:elearning_app/screens/home/home_screen.dart';
import 'package:elearning_app/screens/splashScreens/splash_screen.dart';
import 'package:get/get.dart';

import '../controllers/question_paper/question_papers/question_papers_controller.dart';
import '../screens/introduction/introduction.dart';
import '../screens/login/login_screen.dart';

class AppRoutes {
  static List<GetPage> route() => [
        GetPage(
          name: "/",
          page: () => SplashScren(),
        ),
        GetPage(
          name: "/introduction",
          page: () => IntroductionScreen(),
        ),
        GetPage(
            name: "/home",
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
      ];
}
