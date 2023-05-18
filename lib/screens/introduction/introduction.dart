import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import 'appcircle_button.dart';

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
              SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                "E learning App , Aplikasi Belajar yang Mudah ",
                style: TextStyle(fontSize: 18, color: onSurfaceTextColor),
              ),
              SizedBox(
                height: 30,
              ),
              AppCircleButton(
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward_outlined,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
