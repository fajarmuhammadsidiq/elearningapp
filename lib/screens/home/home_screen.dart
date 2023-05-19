import 'package:elearning_app/controllers/question_paper/question_papers/question_papers_controller.dart';
import 'package:elearning_app/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../widget/app_icons_text.dart';
import '../../configs/themes/custom_textstyle.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widget/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: ContentArea(
      child: Obx(
        () => ListView.separated(
            padding: UIParameters.mobileScreenPadding,
            itemBuilder: (context, index) {
              return QuestionCard(
                  model: _questionPaperController.allPapers[index]);
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: _questionPaperController.allPapers.length),
      ),
    ));
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.model});

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: UIParameters.cardBorderRadius),
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Stack(clipBehavior: Clip.none, children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  child: SizedBox(
                    height: Get.width * 0.15,
                    width: Get.width * 0.15,
                    child: CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/app_splash_logo.png"),
                        placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                        imageUrl: model.imageUrl!),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.title!, style: cartTiles(context)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Text(model.description!),
                    ),
                    Row(
                      children: [
                        AppIconText(
                          text: Text(
                            "${model.questionCount} questions",
                            style: detailText.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                          ),
                          icon: Icon(
                            Icons.help_outline,
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        AppIconText(
                          text: Text(
                            "${model.timeInMinutes()}",
                            style: detailText.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                          ),
                          icon: Icon(
                            Icons.help_outline,
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
              right: -10,
              bottom: -10,
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(cardBorderRadius),
                        topLeft: Radius.circular(cardBorderRadius)),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(
                    Icons.wine_bar,
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
