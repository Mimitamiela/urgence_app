import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage('assets/images/logo.jpg')),
          SizedBox(height: 40),
          Text(
            "Welcom to Help Me App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
          )
        ],
      ),
    );
  }
}
