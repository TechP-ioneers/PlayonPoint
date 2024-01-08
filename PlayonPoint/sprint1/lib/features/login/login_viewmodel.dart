
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:sprint1/configs/service_locator.dart';
import 'package:sprint1/features/home/home.dart';
import 'package:sprint1/models/user_model.dart';
import 'package:sprint1/services/user/user_service.dart';

class LoginViewModel extends Viewmodel {
  final UserService _userService = locator();
  final BuildContext context;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginViewModel({required this.context});

  Future<void> login(User loggedUser) async {
    String username = usernameController.text;
    String password = passwordController.text;

    bool isAuthenticated =
        await _userService.authenticateUser(username, password);

    if (isAuthenticated) {
      loggedUser = await _userService.getUser(username);

    } else {}
    update();
  }

   Future<User> getUserData() async {
    // Fetch user data after successful authentication
    String username = usernameController.text;
    return await _userService.getUser(username);
  }
}
