import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void togleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {}

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
}
