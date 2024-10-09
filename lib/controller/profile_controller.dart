import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:urgence_app/model/student_model.dart';

class ProfileController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxList<StudentModel> studentsList = <StudentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getInfoStudent();
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
          // Map the document data directly to a StudentModel
          StudentModel student = StudentModel.fromJson(data);
          studentsList.add(student);
          print("Student data added: ${student.firstName} ${student.lastName}");
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
}
