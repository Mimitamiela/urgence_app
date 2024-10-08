import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  bool isSelected = false;
  void toggleSelected() {
    isSelected = !isSelected;
  }
}
