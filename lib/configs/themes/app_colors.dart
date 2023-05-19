import 'package:elearning_app/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

import 'app_dark.dart';
import 'app_light.dart';

const onSurfaceTextColor = Colors.white;
const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;
Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? Color(0xFF2E3C62)
    : Color.fromARGB(255, 240, 237, 255);
