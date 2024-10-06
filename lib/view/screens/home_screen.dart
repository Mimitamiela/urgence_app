import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        ),
        body: Container());
  }
}
