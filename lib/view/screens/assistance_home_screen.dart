import 'package:flutter/material.dart';

class AssistanceHomeScreen extends StatelessWidget {
  const AssistanceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('ASSISTANCE HOME'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              "assets/images/7N2O.gif",
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 250, 232, 232),
        child: const Center(child: Card()),
      ),
    );
  }
}
