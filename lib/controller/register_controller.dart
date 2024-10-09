import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:urgence_app/view/screens/auth/login_screen.dart';

class RegisterController extends GetxController {
  List<String> bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  List<String> gender = ['Male', 'Female'];
  RxString selectedBloodType = 'O+'.obs;
  RxString selectedGender = 'Male'.obs;
  final firstNameControlor = TextEditingController();
  final lastNameControlor = TextEditingController();
  final phoneNumberControlor = TextEditingController();
  final parentPhoneNumberControlor = TextEditingController();
  final diseasesControlor = TextEditingController();
  final emailControlor = TextEditingController();
  final passwordControlor = TextEditingController();
  final dateOfBirthControlor = TextEditingController();
  String age = "";
  Rx<File?> imageFile = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  final isShow = false.obs;
  final isLoading = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void toggleShow() {
    isShow.value = !isShow.value;
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      dateOfBirthControlor.text =
          "${picked.year}-${picked.month}-${picked.day}";

      // حساب العمر
      final now = DateTime.now();
      int calculatedAge = now.year - picked.year;
      if (now.month < picked.month ||
          (now.month == picked.month && now.day < picked.day)) {
        calculatedAge--;
      }
      age = calculatedAge.toString();

      dateOfBirthControlor.text =
          "${picked.year}-${picked.month}-${picked.day} ($age years)";
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<String?> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName =
          'Student Images/${FirebaseAuth.instance.currentUser!.uid}.jpg';
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<void> register() async {
    try {
      isLoading.value = true;

      String? imageUrl;
      if (imageFile.value != null) {
        imageUrl = await uploadImageToFirebase(imageFile.value!);
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControlor.text.trim(),
        password: passwordControlor.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('students')
          .doc(userCredential.user!.uid)
          .set({
        'firstName': firstNameControlor.text.trim(),
        'lastName': lastNameControlor.text.trim(),
        'phoneNumber': phoneNumberControlor.text.trim(),
        'parentPhoneNumber': parentPhoneNumberControlor.text.trim(),
        'diseases': diseasesControlor.text.trim(),
        'email': emailControlor.text.trim(),
        'dateOfBirth': dateOfBirthControlor.text.trim(),
        'sex': selectedGender.value,
        'bloodType': selectedBloodType.value,
        'imageUrl': imageUrl,
      });

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      print("Registration Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
