import 'package:elearning_app/controllers/question_paper/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/dialogs/dialogs_widget.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    // TODO: implement onReady
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void togleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void emailMe() {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'fajars328@gmail.com');
    launchEmail(emailUri.toString());
  }

  Future<void> launchEmail(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }

  void showTentangSayaAlertDialogue() {
    Get.dialog(
        Dialogs.questionStartDialogue(
            onTap: () {
              Get.back();
            },
            title: "Tentang Saya",
            subtitle:
                "Saya adalah seorang mahasiswa Teknologi Informasi yang antusias dan bersemangat. Setiap hari, saya terlibat dalam berbagai mata kuliah yang menarik di universitas, mulai dari pemrograman dasar hingga keamanan jaringan. Dalam mata kuliah pemrograman, saya mempelajari bahasa pemrograman seperti Java, Python, dan C++. Saya senang menghadapi tantangan dalam menyelesaikan tugas-tugas pemrograman dan menciptakan program yang inovatif"),
        barrierDismissible: false);
  }
}
