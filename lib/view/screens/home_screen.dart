import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urgence_app/controller/home_screen_controller.dart';
import 'package:urgence_app/view/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());

    return Obx(() => AnimatedTheme(
          data: homeScreenController.isDarkMode.value
              ? ThemeData.dark().copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: Colors.redAccent,
                    secondary: Colors.blueAccent,
                  ),
                )
              : ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Colors.redAccent,
                    secondary: Colors.blueAccent,
                  ),
                ),
          duration: const Duration(milliseconds: 500),
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Location Services: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                  ),
                                ),
                                TextSpan(
                                  text: homeScreenController.isLocationOn.value
                                      ? "ON"
                                      : "OFF",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        homeScreenController.isLocationOn.value
                                            ? Colors.green
                                            : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return RotationTransition(
                                turns: animation,
                                child: child,
                              );
                            },
                            child: InkWell(
                              onTap: () =>
                                  homeScreenController.toggleDarkMode(),
                              child: Container(
                                  key: ValueKey<bool>(
                                      homeScreenController.isLocationOn.value),
                                  child: homeScreenController.isDarkMode.value
                                      ? Image.asset(
                                          "assets/images/night_mode.png",
                                        )
                                      : Image.asset(
                                          "assets/images/light_mode.png",
                                        )),
                            ),

                            // IconButton(
                            //   key: ValueKey<bool>(
                            //       homeScreenController.isDarkMode.value),
                            //   icon: Icon(
                            //     homeScreenController.isDarkMode.value
                            //         ? Icons.dark_mode
                            //         : Icons.light_mode,
                            //     color: Theme.of(context).iconTheme.color,
                            //   ),
                            //   onPressed: () =>
                            //       homeScreenController.toggleDarkMode(),
                            // ),
                          ),
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: IconButton(
                              onPressed: () {
                                Get.to(() => const ProfileScreen());
                              },
                              icon: const Icon(
                                Icons.person,
                              ),
                              color: Theme.of(context).colorScheme.onPrimary,
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
                    Obx(() => Container(
                          height:
                              homeScreenController.animationValue.value + 60,
                          width: homeScreenController.animationValue.value + 60,
                          decoration: BoxDecoration(
                            color: const Color(0xfffbc8c9),
                            borderRadius: BorderRadius.circular(200),
                          ),
                        )),
                    Obx(() => Container(
                          height:
                              homeScreenController.animationValue.value + 30,
                          width: homeScreenController.animationValue.value + 30,
                          decoration: BoxDecoration(
                            color: const Color(0xfff95150),
                            borderRadius: BorderRadius.circular(200),
                          ),
                        )),
                    Obx(() => Container(
                          height: homeScreenController.animationValue.value,
                          width: homeScreenController.animationValue.value,
                          decoration: BoxDecoration(
                            color: const Color(0xfff90101),
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: const Center(
                            child: Text("Help",
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white)),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildChoiceChip(
                            context,
                            "Ambulance",
                            "assets/images/ambulance.png",
                            0,
                            homeScreenController,
                          ),
                          const SizedBox(width: 10),
                          _buildChoiceChip(
                            context,
                            "Civil Protection",
                            "assets/images/fire_truck.png",
                            1,
                            homeScreenController,
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.phone_rounded,
                              color: Theme.of(context).colorScheme.primary,
                              size: 25,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Manage Contacts",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _buildChoiceChip(BuildContext context, String label, String imagePath,
    int index, HomeScreenController controller) {
  final isSelected = controller.selectedChip.value == index;
  final isDarkMode = controller.isDarkMode.value;

  return ChoiceChip(
    // avatar: Image.asset(imagePath),
    chipAnimationStyle: ChipAnimationStyle(
        avatarDrawerAnimation: AnimationStyle(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    )),
    label: Text(
      label,
      style: TextStyle(
        color: isSelected
            ? (isDarkMode ? Colors.white : Colors.black)
            : Theme.of(context).textTheme.bodyLarge?.color,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    ),
    selected: isSelected,
    selectedColor: (index == 0 ? Colors.red : Colors.blue)
        .withOpacity(isDarkMode ? 0.3 : 0.2),
    backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
    onSelected: (selected) {
      if (selected) {
        controller.setSelectedChip(index);
      }
    },
  );
}
