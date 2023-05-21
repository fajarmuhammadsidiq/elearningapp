import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning_app/configs/themes/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/custom_textstyle.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/question_paper/question_papers/question_papers_controller.dart';
import '../../models/question_paper_model.dart';
import '../../widget/app_icons_text.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({super.key, required this.model});

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: UIParameters.cardBorderRadius),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestions(paper: model);
        },
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
                      AppIcons.tropyOutLine,
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
