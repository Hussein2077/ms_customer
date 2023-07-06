
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utilities/routes.dart';
import '../widgets/snackbar.dart';
import 'auht_repo.dart';

abstract class LoginController extends GetxController {}

class LoginControllerImplement extends LoginController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  CollectionReference customers =
  FirebaseFirestore.instance.collection('customers');

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await customers.doc(docId).get();
      return doc.exists;
    } catch (e) {
      return false;
    }
  }

  bool docExists = false;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() async {
      User user = FirebaseAuth.instance.currentUser!;

      print(googleUser!.id);
      print(FirebaseAuth.instance.currentUser!.uid);
      print(googleUser);
      print(user);
      final SharedPreferences pref=await _prefs;
      pref.setString('customerId', user.uid);
      print(user.uid);

      docExists = await checkIfDocExists(user.uid);

      docExists == false
          ? await customers.doc(user.uid).set({
        'name': user.displayName,
        'email': user.email,
        'profileimage': user.photoURL,
        'phone': '',
        'address': '',
        'cid': user.uid
      }).then((value) => navigate())
          : navigate();
    });
  }

  late String email;
  late String password;
  bool processing = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = true;

  void navigate() {
    //Get.to(AppRoutes.customerHomeScreen);
    Get.offAllNamed(AppRoutes.customerHomeScreen);
    // Navigator.pushReplacementNamed(context, AppR);
  }

  void logIn() async {

      processing = true;

    if (formKey.currentState!.validate()) {
      try {
        await AuthRepo.signInWithEmailAndPassword(email, password);

        await AuthRepo.reloadUserData();
        if (await AuthRepo.checkEmailVerification()) {
          formKey.currentState!.reset();
          User user = FirebaseAuth.instance.currentUser!;

          final SharedPreferences pref=await _prefs;
          pref.setString('customerId', user.uid);


          navigate();
        } else {
          MyMessageHandler.showSnackBar(
              scaffoldKey, 'please check your inbox');

            processing = false;

        }
      } on FirebaseAuthException catch (e) {

          processing = false;

        MyMessageHandler.showSnackBar(scaffoldKey, e.message.toString());
      }
    } else {

        processing = false;

      MyMessageHandler.showSnackBar(scaffoldKey, 'please fill all fields');
    }
  }



}
