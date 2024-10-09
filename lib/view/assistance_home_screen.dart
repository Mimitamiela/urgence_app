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
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/7N2O.gif"),
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
