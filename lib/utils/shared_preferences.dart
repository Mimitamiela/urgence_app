import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPreferences {
  static const String _isLoggedIn = "isLoggedIn";

  void saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isLoggedIn, isLoggedIn);
  }

  Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedIn) ?? false;
  }

  void clearLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_isLoggedIn);
  }
}
