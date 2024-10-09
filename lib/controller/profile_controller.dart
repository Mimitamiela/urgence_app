import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgence_app/model/student_model.dart';

class ProfileController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<String> bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  List<String> gender = ['Male', 'Female'];
  RxString selectedGender = 'Male'.obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController parentPhoneNumberController = TextEditingController();
  TextEditingController diseasesController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  RxList<StudentModel> studentsList = <StudentModel>[].obs;
  RxString profileImageUrl = ''.obs;
  var isEditing = false.obs;
  var isFieldsEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    getInfoStudent();
  }

  void toggleEdit() {
    isEditing.value = !isEditing.value;
  }

  void getInfoStudent() async {
    var user = auth.currentUser;
    if (user == null) {
      Get.snackbar("Error", "No user is currently logged in.");
      return;
    }

    try {
      DocumentSnapshot documentSnapshot =
          await firestore.collection("students").doc(user.uid).get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>?;

        if (data != null) {
          StudentModel student = StudentModel.fromJson(data);
          studentsList.add(student);

          profileImageUrl.value = student.imageUrl ?? '';

          firstNameController.text = student.firstName ?? '';
          lastNameController.text = student.lastName ?? '';
          phoneNumberController.text = student.phoneNumber ?? '';
          parentPhoneNumberController.text = student.parentPhoneNumber ?? '';
          diseasesController.text = student.diseases ?? '';
          emailController.text = student.email ?? '';
          bloodTypeController.text = student.bloodType ?? '';
          dateOfBirthController.text = student.dateOfBirth ?? '';
          selectedGender.value = student.gender ?? 'Male';
        } else {
          Get.snackbar("Error", "No student data found.");
        }
      } else {
        Get.snackbar("Error", "Document does not exist.");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void updateStudentInfo() async {
    var user = auth.currentUser;
    if (user == null) {
      Get.snackbar("Error", "No user is currently logged in.");
      return;
    }

    try {
      await firestore.collection("students").doc(user.uid).update({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'phoneNumber': phoneNumberController.text,
        'parentPhoneNumber': parentPhoneNumberController.text,
        'diseases': diseasesController.text,
        'email': emailController.text,
        'bloodType': bloodTypeController.text,
        'dateOfBirth': dateOfBirthController.text,
        'gender': selectedGender.value,
      });

      Get.snackbar("Success", "Profile updated successfully.");

      firstNameController.text = firstNameController.text;
      lastNameController.text = lastNameController.text;
      phoneNumberController.text = phoneNumberController.text;
      parentPhoneNumberController.text = parentPhoneNumberController.text;
      diseasesController.text = diseasesController.text;
      emailController.text = emailController.text;
      bloodTypeController.text = bloodTypeController.text;
      dateOfBirthController.text = dateOfBirthController.text;

      toggleEdit();
      getInfoStudent();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
