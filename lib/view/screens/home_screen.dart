import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgence_app/controller/login_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Urgence App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  loginController.logout();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        body: Center(
            child: Container(
                child: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.deepPurple, fontSize: 30),
        ))));
  }
}
