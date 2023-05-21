import 'package:elearning_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
                top: 20,
                right: 40,
                child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.togleDrawer();
                    }))
          ],
        )),
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style:
                    TextButton.styleFrom(foregroundColor: onSurfaceTextColor))),
      ),
    );
  }
}
