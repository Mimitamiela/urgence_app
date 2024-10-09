import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgence_app/utils/shared_preferences.dart';
import 'package:urgence_app/view/screens/assistance_home_screen.dart';
import 'package:urgence_app/view/screens/auth/login_screen.dart';
import 'package:urgence_app/view/screens/home_screen.dart';

class LoginController extends GetxController {
  final emailControlor = TextEditingController();
  final passwordControlor = TextEditingController();
  final isShow = false.obs;
  final isLoading = false.obs;
  final RxBool userType = true.obs;

  AuthSharedPreferences authSharedPreferences = AuthSharedPreferences();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void isUserType() {
    userType.value = !userType.value;
  }

  void toggleShow() {
    isShow.value = !isShow.value;
  }

  Future<void> login() async {
    isLoading.value = true;
    String email = emailControlor.text.trim();
    String password = passwordControlor.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
      isLoading.value = false;

      return;
    }

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      authSharedPreferences.saveLoginStatus(true);
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

    authSharedPreferences.clearLoginStatus();
    Get.offAll(() => const LoginScreen());

    isLoading.value = false;
  }

  void resetPassword() async {
    String email = emailControlor.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email address.',
        icon: const Icon(Icons.error, color: Colors.red),
        backgroundColor: Colors.white,
        colorText: Colors.red,
        animationDuration: const Duration(milliseconds: 1000),
        duration: const Duration(seconds: 6),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      );
      return;
    }

    try {
      QuerySnapshot userSnapshot = await firestore
          .collection("students")
          .where("email", isEqualTo: email)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        Get.snackbar(
          'Success',
          'A password reset email has been sent. Please check your inbox.',
          icon: const Icon(Icons.verified_outlined, color: Colors.green),
          backgroundColor: Colors.white,
          colorText: Colors.green,
          animationDuration: const Duration(milliseconds: 1000),
          duration: const Duration(seconds: 20),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING,
        );

        Get.to(const LoginScreen());
      } else {
        Get.snackbar(
          'Error',
          'No user found with this email.',
          icon: const Icon(Icons.error, color: Colors.red),
          backgroundColor: Colors.white,
          colorText: Colors.red,
          animationDuration: const Duration(milliseconds: 1000),
          duration: const Duration(seconds: 6),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING,
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'An unexpected error occurred.',
        icon: const Icon(Icons.error, color: Colors.red),
        backgroundColor: Colors.white,
        colorText: Colors.red,
        animationDuration: const Duration(milliseconds: 1000),
        duration: const Duration(seconds: 6),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred.',
        icon: const Icon(Icons.error, color: Colors.red),
        backgroundColor: Colors.white,
        colorText: Colors.red,
        animationDuration: const Duration(milliseconds: 1000),
        duration: const Duration(seconds: 6),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      );
    }
  }

  Future<void> AssistanceLogin() async {
    isLoading.value = true;
    String email = emailControlor.text.trim();
    String password = passwordControlor.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
      isLoading.value = false;

      return;
    }

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      authSharedPreferences.saveLoginStatus(true);
      Get.to(const AssistanceHomeScreen());
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
}
