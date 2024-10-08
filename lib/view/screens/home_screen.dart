import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgence_app/controller/home_screen_controller.dart';
import 'package:urgence_app/controller/login_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 1.5,
                )),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Loctaion Services:ON",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.dark_mode,
                        color: Colors.redAccent,
                      )),
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: const Color(0xfffbc8c9),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            Container(
              height: 270,
              width: 270,
              decoration: BoxDecoration(
                color: const Color(0xfff95150),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            Container(
              height: 240,
              width: 240,
              decoration: BoxDecoration(
                color: const Color(0xfff90101),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            const Text("Help",
                style: TextStyle(fontSize: 50, color: Colors.white)),
          ],
        ),
        // const Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 30),
        //   child: Row(
        //     children: [ChoiceChip(label: "Ambulance",
        //      selected:

        //      )],
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 1.5,
                )),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.contact_phone,
                        color: Colors.redAccent,
                      )),
                  SizedBox(width: 8),
                  Text(
                    "Manage Contacts",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
