import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgence_app/view/screens/auth/login_screen.dart';

class RegisterController extends GetxController {
  List<String> bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  RxString selectedBloodType = 'O+'.obs;
  final firstNameControlor = TextEditingController();
  final lastNameControlor = TextEditingController();
  final phoneNumberControlor = TextEditingController();
  final parentPhoneNumberControlor = TextEditingController();
  final diseasesControlor = TextEditingController();
  final emailControlor = TextEditingController();
  final passwordControlor = TextEditingController();
  final isShow = false.obs;
  final isLoading = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void toggleShow() {
    isShow.value = !isShow.value;
  }

  Future<void> register() async {
    isLoading.value = true;
    String email = emailControlor.text.trim();
    String password = passwordControlor.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await firestore.collection("students").doc(userCredential.user!.uid).set({
        "firstName": firstNameControlor.text,
        "lastName": lastNameControlor.text,
        "phoneNumber": phoneNumberControlor.text,
        "parentPhoneNumber": parentPhoneNumberControlor.text,
        "bloodType": selectedBloodType.value,
        "diseases": diseasesControlor.text,
        "createdAt": DateTime.now(),
      });
      Get.to(const LoginScreen());
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = 'The email address is already in use.';
          break;
        case 'invalid-email':
          message = 'Incorrect password.';
          break;
        case ' weak-password':
          message = 'The email address is weak.';
          break;
        default:
          message = 'Registration failed. Please try again.';
      }
      Get.snackbar('Error', message);

      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred.');
    }
  }
}
