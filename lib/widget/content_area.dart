import 'package:flutter/material.dart';
import 'package:elearning_app/configs/themes/ui_parameters.dart';

import '../configs/themes/app_colors.dart';

class ContentArea extends StatelessWidget {
  ContentArea({this.addPadding = true, required this.child, super.key});
  final bool addPadding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10),
      ),
      child: Ink(
        child: child,
        padding: addPadding
            ? EdgeInsets.only(
                top: mobileScreenPadding,
                left: mobileScreenPadding,
                right: mobileScreenPadding)
            : EdgeInsets.zero,
        decoration: BoxDecoration(color: customScaffoldColor(context)),
      ),
    );
  }
}
