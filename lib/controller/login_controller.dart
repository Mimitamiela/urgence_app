import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgence_app/view/screens/home_screen.dart';

class LoginController extends GetxController {
  final emailControlor=TextEditingController();
   final PasswordControlor=TextEditingController();
  final isShow = false.obs;

  void toggleShow() {
    isShow.value = !isShow.value;
  
  }

  Future<void> login () async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailControlor.text, password: PasswordControlor.text);
    Get.to(HomeScreen());
  }
}
