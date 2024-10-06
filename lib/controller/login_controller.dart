import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgence_app/view/screens/auth/login_screen.dart';
import 'package:urgence_app/view/screens/home_screen.dart';

class LoginController extends GetxController {
  final emailControlor = TextEditingController();
  final passwordControlor = TextEditingController();
  final isShow = false.obs;
  final isLoading = false.obs;

  void toggleShow() {
    isShow.value = !isShow.value;
  }

  Future<void> login() async {
    isLoading.value = true;
    String email = emailControlor.text.trim();
    String password = passwordControlor.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
      return;
    }

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.to(const HomeScreen());
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email.';
          break;
        case 'wrong-password':
          message = 'Incorrect password.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        default:
          message = 'Login failed. Please try again.';
      }
      Get.snackbar('Error', message);

      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred.');
    }
  }

  void logout() {
    isLoading.value = true;
    FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginScreen());

    isLoading.value = false;
  }
}
