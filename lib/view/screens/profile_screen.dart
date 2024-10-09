import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgence_app/controller/profile_controller.dart';
import 'package:urgence_app/model/student_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    // TextEditingController to manage firstName input
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameControlor = TextEditingController();
    TextEditingController phoneNumberControlor = TextEditingController();
    TextEditingController parentPhoneNumberControlor = TextEditingController();
    TextEditingController diseasesControlor = TextEditingController();
    TextEditingController emailControlor = TextEditingController();
    TextEditingController bloodTypeControlor = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text('Profile',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              const Text(
                "Information is circular in case of emergency",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0xfffbc8c9),
                  borderRadius: BorderRadius.circular(200),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(() {
                  // Check if studentsList is not empty before accessing the first student's data
                  if (profileController.studentsList.isNotEmpty) {
                    // Set the first name to the controller
                    firstNameController.text =
                        profileController.studentsList[0].firstName ?? '';

                    return TextFormField(
                      style: const TextStyle(color: Colors.black, height: 1.5),
                      controller: firstNameController, // Bind the controller
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter your first name',
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(() {
                  // Check if studentsList is not empty before accessing the first student's data
                  if (profileController.studentsList.isNotEmpty) {
                    // Set the first name to the controller
                    lastNameControlor.text =
                        profileController.studentsList[0].lastName ?? '';

                    return TextFormField(
                      style: const TextStyle(color: Colors.black, height: 1.5),
                      controller: lastNameControlor, // Bind the controller
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter your last name',
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(() {
                  // Check if studentsList is not empty before accessing the first student's data
                  if (profileController.studentsList.isNotEmpty) {
                    // Set the first name to the controller
                    emailControlor.text =
                        profileController.studentsList[0].email ?? '';

                    return TextFormField(
                      style: const TextStyle(color: Colors.black, height: 1.5),
                      controller: emailControlor, // Bind the controller
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter your last name',
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(() {
                  // Check if studentsList is not empty before accessing the first student's data
                  if (profileController.studentsList.isNotEmpty) {
                    // Set the first name to the controller
                    phoneNumberControlor.text =
                        profileController.studentsList[0].phoneNumber ?? '';

                    return TextFormField(
                      style: const TextStyle(color: Colors.black, height: 1.5),
                      controller: phoneNumberControlor, // Bind the controller
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter your last name',
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(() {
                  // Check if studentsList is not empty before accessing the first student's data
                  if (profileController.studentsList.isNotEmpty) {
                    // Set the first name to the controller
                    parentPhoneNumberControlor.text =
                        profileController.studentsList[0].parentPhoneNumber ??
                            '';

                    return TextFormField(
                      style: const TextStyle(color: Colors.black, height: 1.5),
                      controller:
                          parentPhoneNumberControlor, // Bind the controller
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter your last name',
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(() {
                  // Check if studentsList is not empty before accessing the first student's data
                  if (profileController.studentsList.isNotEmpty) {
                    // Set the first name to the controller
                    diseasesControlor.text =
                        profileController.studentsList[0].diseases ?? '';

                    return TextFormField(
                      style: const TextStyle(color: Colors.black, height: 1.5),
                      controller: diseasesControlor, // Bind the controller
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter your last name',
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   child: Obx(() {
              //     // Check if studentsList is not empty before accessing the first student's data
              //     if (profileController.studentsList.isNotEmpty) {
              //       // Set the first name to the controller
              //       bloodTypeControlor  = profileController.studentsList[0].bloodType ??
              //           '' ;

              //       return TextFormField(
              //         style: const TextStyle(color: Colors.black, height: 1.5),
              //         controller: bloodTypes
              //             as TextEditingController, // Bind the controller
              //         keyboardType: TextInputType.name,
              //         decoration: const InputDecoration(
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(15),
              //             ),
              //             borderSide: BorderSide(color: Colors.red),
              //           ),
              //           labelText: 'Last Name',
              //           labelStyle: TextStyle(color: Colors.black),
              //           hintText: 'Enter your last name',
              //           prefixIcon: Icon(
              //             Icons.person_outlined,
              //             color: Colors.red,
              //           ),
              //         ),
              //       );
              //     } else {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //   }),
              // ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
