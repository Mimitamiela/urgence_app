import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urgence_app/controller/register_controller.dart';
import 'package:urgence_app/view/screens/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController registerController = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text(
          "Register Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    registerController.pickImage(); // فتح منتقي الصور عند النقر
                  },
                  child: Center(
                    child: Stack(clipBehavior: Clip.none, children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        radius: 50,
                        backgroundImage:
                            registerController.imageFile.value != null
                                ? FileImage(registerController.imageFile.value!)
                                : null, // صورة افتراضية
                        child: registerController.imageFile.value == null
                            ? const Icon(Icons.add_a_photo,
                                size: 50, color: Colors.redAccent)
                            : null,
                      ),
                    ]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: registerController.firstNameControlor,
                  style: const TextStyle(color: Colors.black, height: 1.5),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your first name',
                    prefixIcon: Icon(
                      Icons.person_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: registerController.lastNameControlor,
                  style: const TextStyle(color: Colors.black, height: 1.5),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your last name',
                    prefixIcon: Icon(
                      Icons.person_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: registerController.emailControlor,
                  style: const TextStyle(color: Colors.black, height: 1.5),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your email',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: registerController.passwordControlor,
                    style: const TextStyle(color: Colors.black, height: 1.5),
                    obscureText: !registerController.isShow.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide: BorderSide(color: Colors.red)),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.black),
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(
                          Icons.key_outlined,
                          color: Colors.red,
                        ),
                        suffixIcon: IconButton(
                          onPressed: registerController.toggleShow,
                          icon: registerController.isShow.value
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye),
                        ),
                        contentPadding: const EdgeInsets.all(12)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: registerController.phoneNumberControlor,
                  style: const TextStyle(color: Colors.black, height: 1.5),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your phone number',
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: registerController.parentPhoneNumberControlor,
                  style: const TextStyle(color: Colors.black, height: 1.5),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Parent Phone Number',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your parent phone number',
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: registerController.diseasesControlor,
                  style: const TextStyle(color: Colors.black, height: 1.5),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Disease',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your disease',
                    prefixIcon: Icon(
                      Icons.sick_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: DropdownButtonFormField(
                    onChanged: (newValue) {
                      if (newValue != null) {
                        registerController.selectedBloodType.value = newValue;
                      }
                    },
                    value: registerController.selectedBloodType.value,
                    items: registerController.bloodTypes
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(color: Colors.red)),
                      labelText: 'Blood Type',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter your blood type',
                      prefixIcon: Icon(
                        Icons.bloodtype_outlined,
                        color: Colors.red,
                      ),
                    ),
                  )),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: registerController.dateOfBirthControlor,
                        style:
                            const TextStyle(color: Colors.black, height: 1.5),
                        readOnly: true,
                        onTap: () {
                          registerController.selectDate(context);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          labelText: 'Date of Birth',
                          prefixIcon: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: DropdownButtonFormField(
                    onChanged: (newValue) {
                      if (newValue != null) {
                        registerController.selectedGender.value = newValue;
                      }
                    },
                    value: registerController.selectedGender.value,
                    items: registerController.gender
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(color: Colors.red)),
                      labelText: 'Sex',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Select your gender',
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: registerController.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            registerController.register();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            backgroundColor: Colors.redAccent,
                            minimumSize: const Size(double.infinity, 50),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          child: const Text("Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                child: const Text(
                  "If you have an account, Sign In",
                ),
                onPressed: () => Get.to(const LoginScreen()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
