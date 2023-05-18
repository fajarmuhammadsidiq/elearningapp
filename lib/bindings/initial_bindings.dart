import 'package:elearning_app/controllers/question_paper/auth_controller.dart';
import 'package:elearning_app/controllers/question_paper/theme_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
