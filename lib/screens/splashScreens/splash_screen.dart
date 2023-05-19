import 'package:flutter/material.dart';

import '../../configs/themes/app_colors.dart';

class SplashScren extends StatelessWidget {
  const SplashScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Image.asset(
            height: 200, width: 200, "assets/images/app_splash_logo.png"),
      ),
    );
  }
}
