import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/controllers/question_paper/auth_controller.dart';
import 'package:elearning_app/services/firebase_storage_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../../firebase/references.dart';
import '../../../models/question_paper_model.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    // TODO: implement onReady
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);
      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageServices>().getImage(paper.title);
        // allPaperImages.add(imgUrl!);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLogin()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed("page");
      } else {
        // Get.toNamed("");
        print(" sudah login");
      }
    } else {
      _authController.showLoginAlertDialogue();
    }
  }
}
