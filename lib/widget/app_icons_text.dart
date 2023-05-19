import 'package:flutter/material.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Widget text;

  AppIconText({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [icon, SizedBox(width: 4), text],
    );
  }
}
