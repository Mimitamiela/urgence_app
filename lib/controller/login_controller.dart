import 'package:get/get.dart';

class LoginController extends GetxController {
  final isShow = false.obs;

  void toggleShow() {
    isShow.value = !isShow.value;
  }
}
