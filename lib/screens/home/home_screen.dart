import 'package:elearning_app/configs/themes/app_colors.dart';
import 'package:elearning_app/controllers/question_paper/question_papers/question_papers_controller.dart';
import 'package:elearning_app/controllers/zoom_drawer_controller.dart';
import 'package:elearning_app/models/question_paper_model.dart';
import 'package:elearning_app/screens/home/question_card.dart';
import 'package:elearning_app/widget/appcircle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../configs/themes/app_icons.dart';
import '../../widget/app_icons_text.dart';
import '../../configs/themes/custom_textstyle.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widget/content_area.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'menu_screen.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(
      builder: (_) {
        return ZoomDrawer(
          menuBackgroundColor: Color.fromARGB(255, 103, 179, 241),
          menuScreenOverlayColor: Color.fromARGB(255, 103, 179, 241),
          menuScreenWidth: double.maxFinite,
          drawerShadowsBackgroundColor: Colors.white,
          slideWidth: MediaQuery.of(context).size.width * 0.7,
          style: DrawerStyle.defaultStyle,
          angle: 0,
          borderRadius: 24,
          showShadow: true,
          controller: _.zoomDrawerController,
          menuScreen: MenuScreen(),
          mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: controller.togleDrawer,
                            icon: Icon(
                              Icons.low_priority_sharp,
                              size: 25,
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(
                                  AppIcons.peace,
                                ),
                                Text(
                                  "Hello friend ",
                                  style: detailText.copyWith(
                                      color: onSurfaceTextColor),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("What do you want to learn today ?",
                                style: headerText),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ContentArea(
                          child: Obx(
                            () => ListView.separated(
                                padding: UIParameters.mobileScreenPadding,
                                itemBuilder: (context, index) {
                                  return QuestionCard(
                                      model: _questionPaperController
                                          .allPapers[index]);
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 20),
                                itemCount:
                                    _questionPaperController.allPapers.length),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    ));
  }
}
