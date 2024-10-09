import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:urgence_app/controller/login_controller.dart';
import 'package:urgence_app/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios), onPressed: Get.back),
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              loginController.logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    backgroundImage:
                        profileController.profileImageUrl.value.isNotEmpty
                            ? NetworkImage(
                                profileController.profileImageUrl.value,
                              )
                            : null,
                    child: profileController.profileImageUrl.value.isEmpty
                        ? Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.change_circle,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // profileController.pickImage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: profileController.firstNameController,
                label: 'First Name',
                hint: 'Enter your first name',
                icon: Icons.person_outlined,
                profileController: profileController,
                field: (student) => student.firstName ?? '',
              ),
              _buildTextField(
                controller: profileController.lastNameController,
                label: 'Last Name',
                hint: 'Enter your last name',
                icon: Icons.person_outlined,
                profileController: profileController,
                field: (student) => student.lastName ?? '',
              ),
              _buildTextField(
                controller: profileController.emailController,
                label: 'Email',
                hint: 'Enter your email',
                icon: Icons.email_outlined,
                profileController: profileController,
                field: (student) => student.email ?? '',
              ),
              _buildTextField(
                controller: profileController.phoneNumberController,
                label: 'Phone Number',
                hint: 'Enter your phone number',
                icon: Icons.phone_outlined,
                profileController: profileController,
                field: (student) => student.phoneNumber ?? '',
              ),
              _buildTextField(
                controller: profileController.parentPhoneNumberController,
                label: 'Parent Phone Number',
                hint: 'Enter parent phone number',
                icon: Icons.phone_outlined,
                profileController: profileController,
                field: (student) => student.parentPhoneNumber ?? '',
              ),
              _buildTextField(
                controller: profileController.diseasesController,
                label: 'Diseases',
                hint: 'Enter known diseases',
                icon: Icons.sick_outlined,
                profileController: profileController,
                field: (student) => student.diseases ?? '',
              ),
              _buildBloodTypeField(profileController: profileController),
              _buildGenderField(profileController: profileController),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Obx(() {
          if (profileController.isEditing.value) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  key: const ValueKey('Cancel'),
                  onPressed: () {
                    profileController.isEditing.value = false;
                    profileController.isFieldsEnabled.value = false;
                  },
                  backgroundColor: Colors.redAccent,
                  child: const Icon(Icons.cancel, color: Colors.white),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  key: const ValueKey('Save'),
                  onPressed: () {
                    profileController.updateStudentInfo();
                    profileController.isEditing.value = false;
                  },
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.save, color: Colors.white),
                ),
              ],
            );
          } else {
            return FloatingActionButton(
              key: const ValueKey('Edit'),
              onPressed: () {
                profileController.toggleEdit();
                profileController.isFieldsEnabled.value = true;
              },
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.mode_edit_outline_outlined,
                  color: Colors.white),
            );
          }
        }),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required ProfileController profileController,
    required String Function(dynamic student) field,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(() {
        if (profileController.studentsList.isNotEmpty) {
          controller.text = field(profileController.studentsList[0]);

          return TextFormField(
            style: const TextStyle(color: Colors.black, height: 1.5),
            controller: controller,
            keyboardType: TextInputType.name,
            enabled: profileController.isEditing.value,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.red),
              ),
              labelText: label,
              labelStyle: const TextStyle(color: Colors.black),
              hintText: hint,
              prefixIcon: Icon(icon, color: Colors.red),
            ),
          );
        } else {
          return _buildShimmerLoading();
        }
      }),
    );
  }

  Widget _buildGenderField({
    required ProfileController profileController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(() {
        if (profileController.studentsList.isNotEmpty) {
          String genderType = profileController.studentsList[0].gender ?? '';
          profileController.genderController.text = genderType;

          return DropdownButtonFormField<String>(
            value: genderType.isNotEmpty
                ? genderType
                : profileController.selectedGender.value,
            onChanged: profileController.isFieldsEnabled.value
                ? (newValue) {
                    if (newValue != null) {
                      profileController.genderController.text = newValue;
                      profileController.selectedGender.value = newValue;
                    }
                  }
                : null,
            items: profileController.gender
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.red),
              ),
              labelText: 'Gender Type',
              labelStyle: const TextStyle(color: Colors.black),
              hintText: 'Select your gender type',
              prefixIcon: genderType == 'Male'
                  ? const Icon(
                      Icons.male_outlined,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.female_outlined,
                      color: Colors.red,
                    ),
            ),
          );
        } else {
          return _buildShimmerLoading();
        }
      }),
    );
  }

  Widget _buildBloodTypeField({
    required ProfileController profileController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(() {
        if (profileController.studentsList.isNotEmpty) {
          String bloodType = profileController.studentsList[0].bloodType ?? '';
          profileController.bloodTypeController.text = bloodType;

          return DropdownButtonFormField<String>(
            value: bloodType.isNotEmpty ? bloodType : null,
            onChanged: profileController.isFieldsEnabled.value
                ? (newValue) {
                    if (newValue != null) {
                      profileController.bloodTypeController.text = newValue;
                    }
                  }
                : null,
            items: profileController.bloodTypes
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.red),
              ),
              labelText: 'Blood Type',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'Select your blood type',
              prefixIcon: Icon(
                Icons.bloodtype_outlined,
                color: Colors.red,
              ),
            ),
          );
        } else {
          return _buildShimmerLoading();
        }
      }),
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 56,
        width: double.infinity - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Loading...',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
