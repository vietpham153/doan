import 'package:flutter_application_1/users/model/user.dart';
import 'package:flutter_application_1/users/userPreferences/user_preferences.dart';
import 'package:get/get.dart';

class CurrentUser extends GetxController{
  final Rx<User> _currentUser = User(0, '', '', '', '', '').obs;
  User get user => _currentUser.value;

  getUserInfo() async{
    User? getUserInfoFromLocalStorage = await RememberUserPrefs.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }
}