import 'package:elearning_app/firebase/references.dart';
import 'package:elearning_app/widget/dialogs/dialogs_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../screens/home/home_screen.dart';
import '../../screens/login/login_screen.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    initAuth();

    super.onReady();
  }

  late FirebaseAuth auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(Duration(seconds: 2));

    auth = FirebaseAuth.instance;
    _authStateChanges = auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  signWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);
        await auth.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  User? getUser() {
    _user.value = auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialogue() {
    Get.dialog(
        Dialogs.questionStartDialogue(
            onTap: () {
              Get.back();
              navigateToLoginPage();
            },
            title: "Hai..",
            subtitle: "must login before start"),
        barrierDismissible: false);
  }

  bool isLogin() {
    return auth.currentUser != null;
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  Future<void> signOut() async {
    await auth.signOut();
    navigateToHomePage();
    print(auth.signOut());
  }

  void navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }
}
