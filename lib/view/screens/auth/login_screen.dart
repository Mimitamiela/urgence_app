import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urgence_app/controller/login_controller.dart';
import 'package:urgence_app/view/assistance_home_screen.dart';
import 'package:urgence_app/view/screens/auth/register_screen.dart';
import 'package:urgence_app/view/screens/auth/reset_passwoed_screen.dart';
import 'package:urgence_app/view/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(image: AssetImage('assets/images/logo.jpg')),
            const SizedBox(height: 40),
            const Text(
              "Welcom to Help Me App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: loginController.emailControlor,
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
                  controller: loginController.passwordControlor,
                  style: const TextStyle(color: Colors.black, height: 1.5),
                  obscureText: !loginController.isShow.value,
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
                        onPressed: loginController.toggleShow,
                        icon: loginController.isShow.value
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye),
                      ),
                      contentPadding: const EdgeInsets.all(12)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const ResetPasswordScreen());
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => SwitchListTile(
                value: loginController.userType.value,
                onChanged: (value) {
                  loginController.isUserType();
                  // if (value == true) {
                  //   Get.to(const HomeScreen());
                  // } else
                  //   {
                  //     Get.to(const AssistanceHomeScreen());
                  //   }
                },
                title: loginController.userType.value
                    ? const Text("Student")
                    : const Text("Assistance"),
                selected: true,
              ),
            ),
            const SizedBox(height: 40),
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: loginController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          if (loginController.userType.value == true) {
                            loginController.login();
                          } else {
                            loginController.AssistanceLogin();
                          }
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
                        child: const Text("Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              child: const Text("If you don't have an account, Sign Up"),
              onPressed: () => Get.to(const RegisterScreen()),
            )
          ],
        ),
      ),
    );
  }
}
