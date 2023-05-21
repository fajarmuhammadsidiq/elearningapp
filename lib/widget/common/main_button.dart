import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
      this.title = '',
      this.enabled = true,
      required this.onTap,
      this.child,
      this.color});

  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: 55,
        width: Get.width,
        child: InkWell(
            onTap: enabled == false ? null : onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color ?? Theme.of(context).cardColor),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child ??
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: onSurfaceTextColor),
                        ),
                      )),
            )),
      ),
    );
  }
}
