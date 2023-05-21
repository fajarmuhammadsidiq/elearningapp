import 'package:elearning_app/controllers/question_paper/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../configs/themes/app_colors.dart';
import '../../widget/common/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
              height: 200, width: 200, "assets/images/app_splash_logo.png"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              textAlign: TextAlign.center,
              "This is E learning App , Study Now ",
              style: TextStyle(
                  color: onSurfaceTextColor, fontWeight: FontWeight.bold),
            ),
          ),
          MainButton(
            onTap: () {
              controller.signWithGoogle();
            },
            child: Stack(children: [
              Positioned(
                  left: 0,
                  bottom: 0,
                  top: 0,
                  child: SvgPicture.asset("assets/icons/google.svg")),
              Center(
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
