import 'package:elearning_app/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

TextStyle cartTiles(context) => TextStyle(
    color: UIParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyLarge!.color
        : Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold);

const detailText = TextStyle(fontSize: 12);
