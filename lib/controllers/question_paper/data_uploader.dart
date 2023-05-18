import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/firebase/references.dart';
import 'package:elearning_app/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../firebase/loading_state.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    uploadData();
    super.onReady();
  }

  final loadingStatus =
      LoadingStatus.loading.obs; //observable reactive variable

  void uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0
    final firestore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json and print path//
    final paperInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in paperInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    print('item number ${questionPapers.length}');
    var batch = firestore.batch();
    for (var element in questionPapers) {
      batch.set(questionPaperRF.doc(element.id), {
        "title": element.title,
        "image_url": element.imageUrl,
        "Description": element.description,
        "time_seconds": element.timeSeconds,
        "questions_count":
            element.questions == null ? 0 : element.questions!.length
      });
      for (var questions in element.questions!) {
        final questionPath =
            questionRF(paperId: element.id!, questionId: questions.id!);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });
        for (var answer in questions.answers!) {
          batch.set(questionPath.collection("answers").doc(answer.identifier),
              {"identifier": answer.identifier, "answer": answer.answer});
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
