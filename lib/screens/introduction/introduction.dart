import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../widget/appcircle_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                "E learning App , Aplikasi Belajar yang Mudah ",
                style: TextStyle(fontSize: 18, color: onSurfaceTextColor),
              ),
              const SizedBox(
                height: 30,
              ),
              IconButton(
                  onPressed: () => Get.offAllNamed("/home"),
                  icon: Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                    size: 40,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
