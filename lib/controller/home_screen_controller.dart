import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var selectedChip = 0.obs;
  late RxDouble animationValue;
  var isDarkMode = false.obs;
  var isLocationOn = false.obs;
  // final LocationService locationService = LocationService();

  // void checkLocationStatus() async {
  //   bool permissionGranted = await locationService.checkLocationPermission();
  //   bool locationEnabled = await locationService.isLocationEnabled();

  //   if (permissionGranted && locationEnabled) {
  //     isLocationOn.value = true;
  //   } else {
  //     isLocationOn.value = false;
  //   }
  // }

  @override
  void onInit() {
    // checkLocationStatus();
    super.onInit();
    animationValue = 240.0.obs;
    startAnimation();
  }

  void setSelectedChip(int index) {
    selectedChip.value = index;
  }

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void startAnimation() {
    RxDouble begin = 240.0.obs;
    RxDouble end = 300.0.obs;
    var isGrowing = true;

    ever(animationValue, (_) {
      if (animationValue.value == end.value) {
        isGrowing = false;
      } else if (animationValue.value == begin.value) {
        isGrowing = true;
      }
    });

    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 50));
      if (isGrowing) {
        animationValue.value += 1;
      } else {
        animationValue.value -= 1;
      }
      return true;
    });
  }
}
