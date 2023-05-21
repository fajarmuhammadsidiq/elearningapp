import 'package:elearning_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widget/dialogs/normal_dialog.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style:
                    TextButton.styleFrom(foregroundColor: onSurfaceTextColor))),
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
                    })),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => controller.user.value == null
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: Text(
                          controller.user.value!.displayName ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                            color: onSurfaceTextColor,
                          ),
                        ),
                      )),
                Spacer(flex: 1),
                DrawerButton(
                  icon: Icons.emoji_people,
                  label: "Tentang Pembuat ",
                  onPressed: () {
                    controller.showTentangSayaAlertDialogue();
                  },
                ),
                DrawerButton(
                  icon: Icons.email,
                  label: "Email Me",
                  onPressed: () => controller.emailMe(),
                ),
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: DrawerButton(
                    icon: Icons.logout,
                    label: "Logout",
                    onPressed: () => controller.signOut(),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  DrawerButton(
      {super.key, required this.icon, required this.label, this.onPressed});
  final IconData? icon;
  final String label;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed, icon: Icon(icon), label: Text(label));
  }
}
