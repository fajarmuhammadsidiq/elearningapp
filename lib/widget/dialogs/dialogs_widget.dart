import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialogue({
    String? title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle!,
            style: TextStyle(),
          )
        ],
      ),
      actions: [TextButton(onPressed: onTap, child: Text("Confirm"))],
    );
  }
}
